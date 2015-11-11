//
//  AFMobileApiManager.m
//  Affinitas
//
//  Created by OnurMac on 11/10/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "AFMobileApiManager.h"
#import "AFUserRoot.h"
#import "AFUserDetailRoot.h"

@implementation AFMobileApiManager

//Shared Instance
+ (AFMobileApiManager *)sharedClient {
    static AFMobileApiManager *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[AFMobileApiManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
        sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.operationQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}

#pragma mark - Client helper methods
//Get the base URL as constants

+ (NSString *)baseURL {
    return MOBILE_BASE_URL_DE;
}

//Init parameter to fetch all user list
//@Param : action = list

- (NSMutableDictionary*)listParam{
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    paramsDict[PARAMATER_ACTION] = PARAMATER_USER_LIST;
    return paramsDict;
}

//Init parameter to fetch selected user's detail
//@Param : action = list
//@Param : id = selcted_user_id

- (NSMutableDictionary*)detailParam:(NSString*)userId{
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    paramsDict[PARAMATER_ACTION] = PARAMATER_USER_DETAIL;
    paramsDict[PARAMATER_USER_ID] = userId;
    return paramsDict;
}

#pragma mark -  API REQUEST CALL
// SEND Request Method
// @path : it performs api's path if exists
// @requestType : it performs request types such as GET etc..
- (void)sendRequestForPath:(NSString *)path requestType:(NSString *)type parameters:(NSDictionary *)parameters completion:(void (^)(JSONModel *response))completionBlock error:(void (^)(NSError *error))errorBlock {
   
    DKLog(K_VERBOSE_MOBILE_API_CLIENT, @"REQUEST URL: %@", [self.baseURL absoluteString]);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:API_HEADER_ACCEPT forHTTPHeaderField:API_HEADER_JSON];
    
    [manager GET:[self.baseURL absoluteString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *arr = responseObject;
        NSString* json = nil;
        NSError* error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:&error];
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        DKLog(K_VERBOSE_MOBILE_API_JSON, @"JSON Response: %@", responseObject);
        
        //Decide which objects that should be returned according to reqeust parameter
        if ([[parameters valueForKey:PARAMATER_ACTION] isEqualToString:PARAMATER_USER_LIST]) {
            AFUserRoot *rootUserList = [[AFUserRoot alloc] initWithString:json error:&error];
            completionBlock(rootUserList);
        }else if([[parameters valueForKey:PARAMATER_ACTION] isEqualToString:PARAMATER_USER_DETAIL]){
            AFUserDetailRoot *rootUserDetail = [[AFUserDetailRoot alloc] initWithString:json error:&error];
            completionBlock(rootUserDetail);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DKLog(K_MOBILE_API_ERROR_HANDLING, @"HTTP Error Code :%@", [operation.response statusCode]);
        DKLog(K_MOBILE_API_ERROR_HANDLING, @"---------------------------------------------------");
        DKLog(K_MOBILE_API_ERROR_HANDLING, @"%@", error.description);
        errorBlock(error);
    }];
}

#pragma mark - API calls
//FETCH User List
- (void)getUserListWithCompletion:(void (^)(id response))completionBlock error:(void (^)(NSError *error))errorBlock {
    [self sendRequestForPath:nil requestType:@"GET" parameters:self.listParam completion:completionBlock error:errorBlock];
}

//FETCH User Details
- (void)getUserDetailWithCompletion:(NSString*)userId errBlock:(void (^)(id response))completionBlock error:(void (^)(NSError *error))errorBlock {
    [self sendRequestForPath:nil requestType:@"GET" parameters:[self detailParam:userId] completion:completionBlock error:errorBlock];
}

@end
