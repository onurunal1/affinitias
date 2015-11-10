//
//  NSString+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSString+DKHelper.h"
#import "DKHelper.h"

@implementation NSString (DKHelper)

#pragma mark - NSString+Random

+ (NSString *)randomNumericString:(NSUInteger)length {

    NSString *letters = @"0123456789";
    NSTimeInterval base = [NSDate timeIntervalSinceReferenceDate];

    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i=0; i < length; i++){
        NSUInteger index = (arc4random_uniform(base) % letters.length);
        [randomString appendFormat:@"%C", [letters characterAtIndex:index]];
    }
    return randomString;
}

+ (NSString *)randomString:(NSUInteger)length {

    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSTimeInterval base = [NSDate timeIntervalSinceReferenceDate];

    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i=0; i < length; i++){
        NSUInteger index = (arc4random_uniform(base) % letters.length);
        [randomString appendFormat:@"%C", [letters characterAtIndex:index]];
    }
    return randomString;
}

#pragma mark - NSString+NSDate

+ (NSString *)stringFromDate:(NSDate *)date style:(NSDateFormatterStyle)style {
    if (date == nil) {
        return nil;
    }
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    df.dateStyle = style;
    return [df stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    if (date == nil || format == nil) {
        return nil;
    }
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = format;
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    return [df stringFromDate:date];
}

#pragma mark - NSString+Helper

- (NSString *)randomizedString {

    srandom((unsigned int)time(NULL));

    NSMutableString *str = [NSMutableString stringWithString:self];
    NSMutableString *result = [NSMutableString new];

    for (int i = 0 ; i < self.length ; i++) {
        NSInteger index = arc4random() % str.length;
        NSString *character = [NSString stringWithFormat:@"%c", [str characterAtIndex:index]];
        [result insertString:character atIndex:0];
        [str deleteCharactersInRange:NSMakeRange(index, 1)];
    }
    return result;
}

- (NSString *)removeDuplicateCharacters {
    NSMutableSet *seenCharacters = [NSMutableSet set];
    NSMutableString *result = [NSMutableString string];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        if (![seenCharacters containsObject:substring]) {
            [seenCharacters addObject:substring];
            [result appendString:substring];
        }
    }];
    return result;
}

- (NSString *)trimWhitespaces {
    return [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
}

- (NSString *)removeAllNewlinesAndIllegalChars {
    return [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
}

#pragma mark - NSString+Regex

- (BOOL)isEmail {
    NSString *regex = @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isAlphaNumeric {
    NSString *regex = @"[A-Z0-9a-z_]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isPhoneNumber {
    NSString *regex = @"^00[0-9]{9,13}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (NSString *)firstOccuranceForPattern:(NSString *)pattern {
    NSRange searchedRange = NSMakeRange(0, [self length]);
    NSError  *error = nil;

    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:searchedRange];
    if (match.numberOfRanges == 0)
        return nil;
    return [self substringWithRange:[match rangeAtIndex:0]];
}

@end
