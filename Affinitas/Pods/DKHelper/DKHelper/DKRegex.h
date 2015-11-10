//
//  DKRegex.h
//  DKHelper
//
//  Created by kevin delord on 30/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A class about regex as strings.
 */
@interface DKRegex : NSObject

/**
 * Returns a regex as a NSString object to get a file's extension.
 */
+ (NSString *)fileExtension;

/**
 * Returns a regex as a NSString object to get a file's name and extension.
 */
+ (NSString *)filenameAndExtension;

@end
