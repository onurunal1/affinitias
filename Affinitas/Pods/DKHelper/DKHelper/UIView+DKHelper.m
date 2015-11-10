//
//  UIView+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIView+DKHelper.h"
#import "DKHelper.h"

@implementation UIView (DKHelper)

#pragma mark - UIView+Load

+ (UIView *)loadFromNib:(NSString *)name {
    NSArray *nibs = [NSBundle.mainBundle loadNibNamed:name owner:self options:nil];
    return nibs.firstObject;
}

#pragma mark - UIView+Constraints
/**
 * creates constraints to adjust the child to match the parents dimensions and position
 */
- (NSArray *)matchParentConstraints {
    if (self.superview != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:false];

        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeRight multiplier:1 constant:0];

        NSArray *newConstraints = @[bottom, top, left, right];
        [self.superview addConstraints:newConstraints];
        return newConstraints;
    }
    return @[];
}

#pragma mark - UIView+Layer

+ (UIView *)verticalGradientLayer:(CGRect)rect topColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor {

    UIView *gradientLayerView = [[UIView alloc] initWithFrame:rect];
    CAGradientLayer *gradient = [CAGradientLayer new];
    gradient.frame = gradientLayerView.bounds;
    gradient.colors = @[(id)topColor.CGColor, (id)bottomColor.CGColor];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1.0);
    [gradientLayerView.layer insertSublayer:gradient atIndex:0];
    return gradientLayerView;
}

- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius {
    [self roundCorner:corner radius:corner maskToBounds:NO];
}

- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius maskToBounds:(BOOL)maskToBounds {
    // Create the path (with only the top-left corner rounded)
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];

    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    maskLayer.masksToBounds = maskToBounds;

    // Set the newly created shape layer as the mask for the image view's layer
    self.layer.mask = maskLayer;
}

#pragma mark - CGRect Methods

- (void)setFrameWidth:(CGFloat)width {
    self.frame = CGRectSetWidth(self.frame, width);
}

- (void)setFrameHeight:(CGFloat)height {
    self.frame = CGRectSetHeight(self.frame, height);
}

- (void)setFrameX:(CGFloat)x {
    self.frame = CGRectSetX(self.frame, x);
}

- (void)setFrameY:(CGFloat)y {
    self.frame = CGRectSetY(self.frame, y);
}

- (void)setFrameOrigin:(CGPoint)origin {
    self.frame = CGRectSetOrigin(self.frame, origin);
}

- (void)setFrameSize:(CGSize)size {
    self.frame = CGRectSetSize(self.frame, size);
}

#pragma mark - CGRect Methods (Getter)

/**
 * Returns the origin value of the receiver's frame.
 */
- (CGPoint)frameOrigin {
    return self.frame.origin;
}

/**
 * Returns the size value of the receiver's frame.
 */
- (CGSize)frameSize {
    return self.frame.size;
}

/**
 * Returns the size.width of the receiver's frame.
 */
- (CGFloat)frameWidth {
    return CGRectGetWidth(self.frame);
}

/**
 * Returns the height of the receiver's frame.
 */
- (CGFloat)frameHeight {
    return CGRectGetHeight(self.frame);
}

/**
 * Returns the origin.x of the receiver's frame.
 */
- (CGFloat)frameX {
    return CGRectGetMinX(self.frame);
}

/**
 * Set the origin.y of the receiver's frame.
 */
- (CGFloat)frameY {
    return CGRectGetMinY(self.frame);
}

@end
