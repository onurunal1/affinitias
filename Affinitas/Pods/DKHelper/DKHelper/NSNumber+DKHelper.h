//
//  NSNumber+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 5/21/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_NSNumber_h__
#define DKHelper_NSNumber_h__

/**
 * A categorized class of NSNumber to add a bunch of helping methods.
 */
@interface NSNumber (DKHelper)

/**
 * Returns the currency value as a string of the receiver.
 *
 * @discussion The locale is the default one.
 *
 * @return A NSString object representing the currency value of the receiver.
 */
- (NSString *)currencyStringValue;

@end

#endif