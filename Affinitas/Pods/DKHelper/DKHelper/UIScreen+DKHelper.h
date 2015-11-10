//
//  UIScreen+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIScreen to add a bunch of helping methods.
 */
@interface UIScreen (DKHelper)

/**
 * Return true if the screen of the device is 3.5 inches big.
 */
+ (BOOL)is35InchScreen;

/**
 * Return true if the screen of the device is 4 inches big.
 */
+ (BOOL)is4InchScreen;

/**
 * Return true if the screen of the device is 4.7 inches big.
 */
+ (BOOL)is47InchScreen;

/**
 * Return true if the screen of the device is 5.5 inches big.
 */
+ (BOOL)is55InchScreen;

@end

