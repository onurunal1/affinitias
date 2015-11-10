//
//  AFConstant.h
//  Affinitas
//
//  Created by OnurMac on 11/10/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#ifndef AFConstant_h
#define AFConstant_h

// Backend URLs and Credentials
#define BACKEND_PLIST 								@"Staging_Backend"

#define MOBILE_BASE_URL_DE                          [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:BACKEND_PLIST ofType:@"plist"]][@"MobileBaseUrl"]

// API route pathes
#define CLIENT_API_GET_PRODUCT_LIST                 @"/list"
#define CLIENT_API_GET_PRODUCT_DETAIL               @"/detail"

//API Header params
#define API_HEADER_JSON                             @"application/json"
#define API_HEADER_ACCEPT                           @"Accept"

#endif /* AFConstant_h */
