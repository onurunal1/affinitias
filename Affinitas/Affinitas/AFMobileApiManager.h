//
//  AFMobileApiManager.h
//  Affinitas
//
//  Created by OnurMac on 11/10/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFMobileApiManager : AFHTTPRequestOperationManager

+ (AFMobileApiManager *)sharedClient;

- (void)getUserListWithCompletion:(void (^)(id response))completionBlock error:(void (^)(NSError *error))errorBlock;
- (void)getUserDetailWithCompletion:(NSString*)userId errBlock:(void (^)(id response))completionBlock error:(void (^)(NSError *error))errorBlock;

@end
