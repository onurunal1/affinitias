//
//  UIColor+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_UIColor_h__
#define DKHelper_UIColor_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIColor to add a bunch of helping methods.
 */
@interface UIColor (DKHelper)

#pragma mark - DEBUG colors

/**
 * Creates and returns a red color object using the specified opacity.
 *
 * @discussion Values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
 * @discussion The color information represented by this object is in the device RGBA colorspace.
 *
 * @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 * @return A red UIColor object.
 */
+ (UIColor *)redColorWithAlpha:(CGFloat)alpha;

/**
 * Creates and returns a green color object using the specified opacity.
 *
 * @discussion Values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
 * @discussion The color information represented by this object is in the device RGBA colorspace.
 *
 * @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 * @return A green UIColor object.
 */
+ (UIColor *)greenColorWithAlpha:(CGFloat)alpha;

/**
 * Creates and returns a blue color object using the specified opacity.
 * 
 * @discussion Values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
 * @discussion The color information represented by this object is in the device RGBA colorspace.
 *
 * @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 * @return A blue UIColor object.
 */
+ (UIColor *)blueColorWithAlpha:(CGFloat)alpha;

/**
 * Creates and returns a yellow color object using the specified opacity.
 *
 * @discussion Values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
 * @discussion The color information represented by this object is in the device RGBA colorspace.
 *
 * @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 * @return A yellow UIColor object.
 */
+ (UIColor *)yellowColorWithAlpha:(CGFloat)alpha;

/**
 * Creates and returns a random color object.
 *
 * @discussion The alpha value is 1.0.
 *
 * @return A random UIColor object.
 */
+ (UIColor *)randomColor;

#pragma mark - RGB(A)

/**
 * Creates and returns a color object using the specified RGB component values.
 *
 * @discussion Values below 0.0 are interpreted as 0.0, and values above 255.0 are interpreted as 255.0
 * @discussion The color information represented by this object is in the device RGBA colorspace.
 * @discussion The alpha is set by default to 1.0
 *
 * @param red The red component of the color object, specified as a value from 0.0 to 255.0.
 * @param green The green component of the color object, specified as a value from 0.0 to 255.0.
 * @param blue The blue component of the color object, specified as a value from 0.0 to 255.0.
 * @return Returns The color object.
 */
+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue;

/**
 * Creates and returns a color object using the specified opacity and RGBA component values.
 *
 * @discussion Values below 0.0 are interpreted as 0.0, values above 255.0 as 255.0 and values aboves 1.0 as 1.0.
 * @discussion The color information represented by this object is in the device RGBA colorspace.
 *
 * @param red The red component of the color object, specified as a value from 0.0 to 255.0.
 * @param green The green component of the color object, specified as a value from 0.0 to 255.0.
 * @param blue The blue component of the color object, specified as a value from 0.0 to 255.0.
 * @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 * @return Returns The color object.
 */
+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;

#pragma mark - Hexa

/**
 * Creates and returns a color object using the given hexadecimal and alpha values.
 *
 * @param hexString The hexadecimal value as a string.
 * @param alpha The opacity value of the color object, specified as a value from 0.0 to 1.0.
 * @return Returns The color object.
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 * Creates and returns a color object using the given hexadecimal value as a NSString.
 *
 * @discussion The alpha is set by default to 1.0
 *
 * @param hexString The hexadecimal value as a string.
 * @return Returns The color object.
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;

/**
 * Creates and returns a color that is between the two given colors, by a given percentage.
 *
 * @discussion The method will generate a range of colors (range between @baseColor and @endColor), and will return the object by the given @percentage.
 * @discussion It is possible to pass Values (@percentage) that are not in the specified range, by passing a Value like this the returned color object is out of the color-range.
 *
 * @param baseColor The color object, that specifies the beginning of the range.
 * @param endColor The color object, that specifies the end of the range.
 * @param percentage The percentage Value for the new Color, specified as a value from 0.0 to 1.0.
 * @return Returns The color object, that is between the two given colors, by percentage.
 */
+ (UIColor *)fadeFromBaseColor:(UIColor*)baseColor toColor:(UIColor *)endColor withPercentage:(CGFloat) percentage;

@end

#endif