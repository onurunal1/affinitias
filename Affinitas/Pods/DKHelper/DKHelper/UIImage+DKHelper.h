//
//  UIImage+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 25/05/15.
//  Copyright (c) 2015 DK. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIImage to add a bunch of helping methods.
 */
@interface UIImage (DKHelper)

/**
 * Creates a new UIImage object that fit the given size;
 *
 * @param image The image to resize.
 * @param size The desired image size.
 * @return A new UIImage object.
 */
+ (UIImage *)scaleImage:(UIImage *)image size:(CGSize)size;

/**
 * Creates a new UIImage object that fit given size.
 *
 * @return A new UIImage object.
 */
- (UIImage *)resizedImageToSize:(CGSize)newSize;

/**
 * Creates a new UIImage object that fit the current screen size.
 *
 * @return A new UIImage object.
 */
- (UIImage *)resizedImageToScreenSize;

@end
