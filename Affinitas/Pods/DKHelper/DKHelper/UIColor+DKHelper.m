//
//  UIColor+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIColor+DKHelper.h"

@implementation UIColor (DKHelper)

#pragma mark - DEBUG colors

+ (UIColor *)redColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:255. g:0 b:0 a:alpha];
}

+ (UIColor *)greenColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:0 g:255. b:0 a:alpha];
}

+ (UIColor *)blueColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:0 g:0 b:255. a:alpha];
}

+ (UIColor *)yellowColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:255. g:255. b:0 a:alpha];
}

+ (UIColor *)randomColor {
    NSTimeInterval base = [NSDate timeIntervalSinceReferenceDate];
    CGFloat randomRed = (arc4random_uniform(base) % 255);
    CGFloat randomGreen = (arc4random_uniform(base) % 255);
    CGFloat randomBlue = (arc4random_uniform(base) % 255);

    return [UIColor r:randomRed g:randomGreen b:randomBlue];
}

#pragma mark - RGB(A)

+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue {
    return [UIColor r:red g:green b:blue a:1];
}

+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255. green:green / 255. blue:blue / 255. alpha:alpha];
}

#pragma mark - Hexa

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    return [UIColor colorFromHexString:hexString alpha:1.0];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor r:((rgbValue & 0xFF0000) >> 16) g:((rgbValue & 0xFF00) >> 8) b:(rgbValue & 0xFF) a:alpha];
}

#pragma mark - Fade

+ (UIColor *)fadeFromBaseColor:(UIColor*)baseColor toColor:(UIColor *)endColor withPercentage:(CGFloat) percentage {
    CGFloat baseRed = 0.0, baseGreen = 0.0, baseBlue = 0.0, baseAlpha = 0.0;
    CGFloat endRed = 0.0, endGreen = 0.0, endBlue = 0.0, endAlpha = 0.0;
    [baseColor getRed:&baseRed green:&baseGreen blue:&baseBlue alpha:&baseAlpha];
    [endColor getRed:&endRed green:&endGreen blue:&endBlue alpha:&endAlpha];
    return [UIColor colorWithRed:(baseRed + ( endRed - baseRed) * percentage)
                    green:(baseGreen + (endGreen - baseGreen) * percentage)
                    blue:(baseBlue + (endBlue - baseBlue) * percentage)
                    alpha:(baseAlpha + (endAlpha - baseAlpha) * percentage)];
}

@end
