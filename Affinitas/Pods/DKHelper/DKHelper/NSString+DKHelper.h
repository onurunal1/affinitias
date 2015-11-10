//
//  NSString+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_NSString_h__
#define DKHelper_NSString_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of NSString to add a bunch of helping methods.
 */
@interface NSString (DKHelper)

#pragma mark - NSString+Random

/**
 * Creates and returns a random numeric string.
 *
 * @param length The desired length of the generated string.
 * @return A random numeric NSString object.
 */
+ (NSString *)randomNumericString:(NSUInteger)length;

/**
 * Creates and returns a random alpha-numeric string.
 *
 * @param length The desired length of the generated string.
 * @return A random alpha-numeric NSString object.
 */
+ (NSString *)randomString:(NSUInteger)length;

#pragma mark - NSString+NSDate

/**
 * Returns a new NSString object created from a NSDate object with a specific format.
 *
 * @discussion The method use a temporary timeZone set to 0.
 * @param date The NSDate to convert into a string. Must not be NULL.
 * @param format The NSString object representing the format in which the date is formatted. Must not be NULL.
 * @return A NSString containing the date with the given date format. NULL if the date or the format isn't valid.
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

/**
 * Returns a new NSString object created from a NSDate object with a specific style.
 *
 * @discussion The method use a temporary timeZone set to 0.
 * @param date The NSDate to convert into a string. Must not be NULL.
 * @param style The NSDateFormatterStyle value to configure the formatter.
 * @return A NSString containing the date with the given date style. NULL if the date isn't valid.
 */
+ (NSString *)stringFromDate:(NSDate *)date style:(NSDateFormatterStyle)style;

#pragma mark - NSString+Helper

/**
 * Returns a new NSString object created from the receiver without any duplicated characters.
 *
 * @return A NSString without any duplicated characters.
 */
- (NSString *)removeDuplicateCharacters;

/**
 * Returns a new NSString object created from the receiver with a randomized characters' order.
 *
 * @return A NSString with a randomized characters' order.
 */
- (NSString *)randomizedString;

/**
 * Returns a new string made by removing from both ends of the receiver whitespace characters.
 *
 * @return A new string without heading and leading whitespaces.
 */
- (NSString *)trimWhitespaces;

/**
 * Returns a new string made by removing from both ends of the receiver any newlines and illegal characters.
 *
 * @return A new string without newlines and illegal characters.
 */
- (NSString *)removeAllNewlinesAndIllegalChars;

#pragma mark - NSString+Regex

/**
 * Verify if the receiver is a valid Email address.
 *
 * @discussion Method from HockeySDK (see BITHockeyHelper.m -> bit_validateEmail(NSString))
 *
 * @return TRUE if the receiver is valid Email address; otherwise FALSE.
 */
- (BOOL)isEmail;

/**
 * Verify if the receiver is an alpha numeric string.
 *
 * @return TRUE if the receiver is an alpha numeric string; otherwise FALSE.
 */
- (BOOL)isAlphaNumeric;

/**
 * Verify if the receiver is a valid phone number.
 *
 * @discussion A valid phone number starts yith '00' and contains between 9 and 13 characters.
 *
 * @return TRUE if the receiver is a valid phone number string; otherwise FALSE.
 */
- (BOOL)isPhoneNumber;

/**
 * Returns a new NSString object corresponding to the first occurence of a given regex pattern within the receiver's string.
 *
 * @param pattern A NSString value representing a regular expression to search with.
 * @return A NSString representing the first occurence. NULL if there is no match.
 */
- (NSString *)firstOccuranceForPattern:(NSString *)pattern;

@end

#endif