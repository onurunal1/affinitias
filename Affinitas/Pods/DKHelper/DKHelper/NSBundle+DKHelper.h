//
//  NSBundle+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 25/05/15.
//  Copyright (c) 2015 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (DKHelper)

/**
 * Returns the value associated with the specified key in the receiver's information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns the value associated with key in the receiver's property list (Info.plist). The localized value of a key is returned when one is available.
 */
+ (id)entryInPListForKey:(NSString *)key;

@end
