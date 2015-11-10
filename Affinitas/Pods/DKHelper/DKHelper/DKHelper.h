//
//  DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_h__
#define DKHelper_h__

#pragma mark - Imports

#import "UIView+DKHelper.h"
#import "UIDevice+DKHelper.h"
#import "NSString+DKHelper.h"
#import "NSObject+DKHelper.h"
#import "NSDate+DKHelper.h"
#import "UIColor+DKHelper.h"
#import "CGSize+DKHelper.h"
#import "CGRect+DKHelper.h"
#import "UIImageView+DKHelper.h"
#import "NSNumber+DKHelper.h"
#import "NSArray+DKHelper.h"
#import "UIScreen+DKHelper.h"
#import "NSPredicate+DKHelper.h"
#import "UIImage+DKHelper.h"
#import "NSBundle+DKHelper.h"
#import "NSOperationQueue+DKHelper.h"
#import "DKRegex.h"

#pragma mark - AppVersion

/**
 * Return a string describing the current version of the application including the build number.
 */
NSString *      appVersion();

#pragma mark - Math

/**
 * Convert degrees to radians.
 */
CGFloat         degreesToRadians(CGFloat degrees);

/**
 * Convert radians to degrees.
 */
CGFloat         radiansToDegrees(CGFloat radians);

#pragma mark - Localization

/**
 * Return the localized version as a string of the key.
 *
 * @discussion This function is a short verion of "NSLocalizedString(key, nil)".
 *
 * @param key The key as a string referencing the localized entity.
 * @return The localized string of the key.
 */
NSString *      L(NSString *key);

#pragma mark - Object verification

/**
 * Get an object from a dictionary.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key into the given dictionary.
 * @return If valid the object for key from the dictionary. Returns nil otherwise.
 * @see BOOL VALID(NSDictionary *dict, id key);
 */
id              OBJECT(NSDictionary *dict, id key);

/**
 * Get an object from a second level dictionary.
 *
 * @discussion This function add some validity tests around this: [[dictionary objectForKey:key1] objectForKey:key2]
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key1 An object used as the first key into the given dictionary.
 * @param key2 An object used as the second the given dictionary.
 * @return If valid the second level object for the keys from the dictionary. Returns nil otherwise.
 * @see BOOL VALID(NSDictionary *dict, id key);
 */
id              OBJECT_FOR_KEYS(NSDictionary *dict, id key1, id key2);

/**
 * Check the validity of an object inside a dictionary.
 *
 * @param dict A NSDictionary object.
 * @param key An object used as a key into the given dictionary.
 * @return True if the dictionary and if the object for key exist and are different from NSNull. Returns false otherwise.
 */
BOOL            VALID(NSDictionary *dict, id key);

#pragma mark - Getters

/**
 * Extract a CGFloat value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new CGFloat value extracted from the given dictionary. If the object isn't valid returns 0 instead.
 */
CGFloat         GET_FLOAT(NSDictionary *dict, id key);

/**
 * Extract a NSInteger value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSInteger value extracted from the given dictionary. If the object isn't valid returns 0 instead.
 */
NSInteger       GET_INTEGER(NSDictionary *dict, id key);

/**
 * Extract a NSNumber value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract a NSNumber value without crashing if an object isn't valid.
 *
 * If the object is a string the NSNumber will be generated with a NSNumberFormatterDecimalStyle.
 *
 * If the object already is a NSNumber then it will be simply returned.
 *
 * If the object is none of the above nil will be returned.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSNumber value extracted from the given dictionary. If the object isn't valid returns nil instead.
 */
NSNumber *      GET_NUMBER(NSDictionary *dict, id key);

/**
 * Extract a NSDate value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSDate value extracted from the given dictionary. If the object isn't valid returns nil instead.
 */
NSDate *        GET_DATE(NSDictionary *dict, id key);

/**
 * Extract a NSString value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSString value extracted from the given dictionary. If the object isn't valid returns nil instead.
 */
NSString *      GET_STRING(NSDictionary *dict, id key);

#pragma mark - DKLog

void            DKLog(BOOL verbose, NSString *format, ...);

#pragma mark - Numbers

/**
 * Check and return a value between minimal and maximum ones. If the given value is outside its limits then returns the appropriate value.
 *
 * @param value A CGFloat value to be return if in between the 'min' and 'max' parameters
 * @param min A CGFloat value corresponding to the minimal 'min' value.
 * @param min A CGFloat value corresponding to the maximal 'max' value.
 * @return A CGFloat value corresponding to the value if it is in between the min/max limits. Otherwise returns either the minimal or maximal value.
 */
CGFloat         MINMAX(CGFloat value, CGFloat min, CGFloat max);

/**
 * Cast an 'int' value as a 'long' type.
 */
long            cL(NSInteger v);

/**
 * Cast an 'int' value as a 'unsigned long' type.
 */
unsigned long   cUL(NSUInteger v);

#pragma mark - Predicate

/**
 * Create and return a 'OR' predicate out of two given predicates.
 *
 * @param a A NSPredicate object. If nil will be ignored.
 * @param b A NSPredicate object. If nil will be ignored.
 * @return A new NSPredicate object created from the parameters one with a 'OR' statement. Could return nil if both parameters are.
 */
NSPredicate *   OR_PREDICATE(NSPredicate *a, NSPredicate *b);

/**
 * Create and return a 'AND' predicate out of two given predicates.
 *
 * @param a A NSPredicate object. If nil will be ignored.
 * @param b A NSPredicate object. If nil will be ignored.
 * @return A new NSPredicate object created from the parameters one with a 'AND' statement. Could return nil if both parameters are.
 */
NSPredicate *   AND_PREDICATE(NSPredicate *a, NSPredicate *b);

#pragma mark - Preprocessor Defines

#define DK_APP_VERSION                              appVersion()
#define __STRING_PRETTY_FUNCTION__                  [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]
#define iOS7Delta                                   [UIDevice iOS7Delta]
#define is35InchScreen                              [UIScreen is35InchScreen]
#define is4InchScreen                               [UIScreen is4InchScreen]
#define is47InchScreen                              [UIScreen is47InchScreen]
#define is55InchScreen                              [UIScreen is55InchScreen]

#endif
