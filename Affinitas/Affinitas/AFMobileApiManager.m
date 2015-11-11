//
//  AFMobileApiManager.m
//  Affinitas
//
//  Created by OnurMac on 11/10/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "AFMobileApiManager.h"
#import "AFUserRoot.h"

@implementation AFMobileApiManager

+ (AFMobileApiManager *)sharedClient {
    static AFMobileApiManager *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[AFMobileApiManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
        sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
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

+ (NSString *)baseURL {
    return MOBILE_BASE_URL_DE;
}

//Init parameter to fetch all user list
//action = list

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
- (void)sendRequestForPath:(NSString *)path requestType:(NSString *)type parameters:(NSDictionary *)parameters completion:(void (^)(JSONModel *response))completionBlock error:(void (^)(NSError *error))errorBlock {
   
    DKLog(K_VERBOSE_MOBILE_API_CLIENT, @"REQUEST URL: %@", [self.baseURL absoluteString]);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[self.baseURL absoluteString] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DKLog(K_VERBOSE_MOBILE_API_JSON, @"JSON Response: %@", responseObject);
        AFUserRoot *rootUserList;
        if ([[parameters valueForKey:PARAMATER_ACTION] isEqualToString:PARAMATER_USER_LIST]) {
            NSMutableArray *arr = responseObject;
            NSString* json = nil;
            NSError* error = nil;
            NSData *data = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:&error];
            json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            rootUserList = [[AFUserRoot alloc] initWithString:json error:&error];
            completionBlock(rootUserList);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
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
