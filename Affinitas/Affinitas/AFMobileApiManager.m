//
//  AFMobileApiManager.m
//  Affinitas
//
//  Created by OnurMac on 11/10/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "AFMobileApiManager.h"

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

#pragma mark -  API REQUEST CALL

- (void)sendRequestForPath:(NSString *)path requestType:(NSString *)type parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *response))completionBlock error:(void (^)(NSError *error))errorBlock {
    
    NSError *err = nil;
    NSString *URL = [[self.baseURL absoluteString] stringByAppendingString:path];
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:type URLString:URL parameters:parameters error:&err];
    [request setValue: API_HEADER_JSON forHTTPHeaderField:API_HEADER_ACCEPT];
    
    DKLog(K_VERBOSE_MOBILE_API_CLIENT, @"REQUEST URL: %@", URL);
    NSString *jsonString;
    if (parameters) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:(NSJSONWritingOptions)0 error:&error];
        if (error) {
            NSLog(@"Error serializing json: %@", error.localizedDescription);
        }
        jsonString = [NSString stringWithFormat:@"json=%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]];
        DKLog(K_VERBOSE_MOBILE_API_JSON, @"Sending request with JSON:\n%@", jsonString);
        [request setHTTPBody: [jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
    
#ifdef STAGING_BACKEND
    operation.allowsInvalidSSLCertificate = YES;
#endif
    [operation start];
}

#pragma mark - API calls

- (void)getProductListWithCompletion:(void (^)(id response))completionBlock error:(void (^)(NSError *error))errorBlock {
    [self sendRequestForPath:nil requestType:@"GET" parameters:nil completion:completionBlock error:errorBlock];
}

@end
