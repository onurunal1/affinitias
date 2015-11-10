//
//  NSNumber+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 5/21/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSNumber+DKHelper.h"

@implementation NSNumber (DKHelper)

- (NSString *)currencyStringValue {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    return [formatter stringFromNumber:self];
}

@end
