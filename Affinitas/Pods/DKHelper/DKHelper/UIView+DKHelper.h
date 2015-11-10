//
//  UIView+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_UIView_h__
#define DKHelper_UIView_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIView to add a bunch of helping methods.
 */
@interface UIView (DKHelper)

#pragma mark - UIView+Load

/**
 * Loads and returns a view from a nib file.
 *
 * @param name The name as a NSString of the nib file in the main bundle.
 * @return If exist the loaded view; otherwise nil.
 */
+ (UIView *)loadFromNib:(NSString *)name;

#pragma mark - UIView+Constraints

/**
 * Creates and add layout constraints to adjust the receiver to match its superview dimensions and position.
 *
 * @return The added layout contraints. Empty array if the receiver does not have a superview.
 */
- (NSArray *)matchParentConstraints;

#pragma mark - UIView+Layer

/**
 * Creates and returns a new vertical gradient view.
 *
 * @param rect The location and dimensions of the new view.
 * @param topColor The top color of the gradient.
 * @param bottomColor The bottom color of the gradient.
 * @return A new UIView object with a gradient color.
 */
+ (UIView *)verticalGradientLayer:(CGRect)rect topColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor;

/**
 * Rounds the specified corner(s) of the receiver with a given radius.
 *
 * @discussion By default set the layer's maskToBound value to NO
 *
 * @param corner A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle or all of them.
 * @param cornerRadius A CGFloat value corresponding to the radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
 */
- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius;

/**
 * Rounds the specified corner(s) of the receiver with a given radius.
 *
 * @param corner A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle or all of them.
 * @param cornerRadius A CGFloat value corresponding to the radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
 * @param maskToBounds A Boolean value to apply, if true, an implicit mask matching the layer bounds (will tell the UIView not to draw everything that is outside itself).
 */
- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius maskToBounds:(BOOL)maskToBounds;

#pragma mark - CGRect Methods (Setter)

/**
 * Set the origin of the receiver's frame.
 *
 * @param origin The new CGPoint value.
 */
- (void)setFrameOrigin:(CGPoint)origin;

/**
 * Set the size of the receiver's frame.
 *
 * @param size The new CGSize value.
 */
- (void)setFrameSize:(CGSize)size;

/**
 * Set the size.width of the receiver's frame.
 *
 * @param width The new CGFloat value.
 */
- (void)setFrameWidth:(CGFloat)width;

/**
 * Set the height of the receiver's frame.
 *
 * @param height The new CGFloat value.
 */
- (void)setFrameHeight:(CGFloat)height;

/**
 * Set the origin.x of the receiver's frame.
 *
 * @param x The new CGFloat value.
 */
- (void)setFrameX:(CGFloat)x;

/**
 * Set the origin.y of the receiver's frame.
 *
 * @param y The new CGFloat value.
 */
- (void)setFrameY:(CGFloat)y;

#pragma mark - CGRect Methods (Getter)

/**
 * Returns the origin value of the receiver's frame.
 */
- (CGPoint)frameOrigin;

/**
 * Returns the size value of the receiver's frame.
 */
- (CGSize)frameSize;

/**
 * Returns the size.width of the receiver's frame.
 */
- (CGFloat)frameWidth;

/**
 * Returns the height of the receiver's frame.
 */
- (CGFloat)frameHeight;

/**
 * Returns the origin.x of the receiver's frame.
 */
- (CGFloat)frameX;

/**
 * Set the origin.y of the receiver's frame.
 */
- (CGFloat)frameY;

@end

#endif