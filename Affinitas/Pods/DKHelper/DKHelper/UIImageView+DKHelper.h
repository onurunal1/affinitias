//
//  UIImageView+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 5/10/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_UIImageView_h__
#define DKHelper_UIImageView_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIImageView to add a bunch of helping methods.
 */
@interface UIImageView (DKHelper)

/**
 * Initializes the receiver with an image name.
 *
 * @param imageName The name of the file. If this is the first time the image is being loaded, the method looks for an image with the specified name in the application’s main bundle.
 * @return The initialiazed receiver.
 */
- (instancetype)initWithImageNamed:(NSString *)imageName;

/**
 * Initializes the receiver with a frame and an image.
 *
 * @param frame The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. 
 * @param image An image containing the source data.
 * @return The initialiazed receiver.
 */
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;

/**
 * Initializes the receiver with a frame and an image name.
 *
 * @param frame The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it.
 * @param imageName The name of the file. If this is the first time the image is being loaded, the method looks for an image with the specified name in the application’s main bundle.
 * @return The initialiazed receiver.
 */
- (instancetype)initWithFrame:(CGRect)frame imageNamed:(NSString *)imageName;

@end

#endif