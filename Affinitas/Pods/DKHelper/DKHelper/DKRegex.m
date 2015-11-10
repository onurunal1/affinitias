//
//  DKRegex.m
//  DKHelper
//
//  Created by kevin delord on 30/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "DKRegex.h"

@implementation DKRegex

+ (NSString *)fileExtension {
    return @".[0-9a-zA-Z]+$";
}

+ (NSString *)filenameAndExtension {
    return @"[0-9a-zA-Z]+.[0-9a-zA-Z]+$";
}

@end
