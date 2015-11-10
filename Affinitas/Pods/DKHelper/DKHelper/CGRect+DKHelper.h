//
//  CGRect+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_CGRect_h__
#define DKHelper_CGRect_h__

/**
 * Returns a Boolean value indicating whether a frame is inside a container.
 *
 * @param frame The frame
 * @param container The container in which the frame is supposed to be.
 * @return YES if the frame is inside the given container.
 */
BOOL    CGRectInsideContainer(CGRect frame, CGRect container);

/**
 * Creates and returns a CGRect structure from a receiver object and a new width.
 *
 * @param rect The original CGRect structure.
 * @param width A CGFloat value indicating the new width value.
 * @return A new CGRect structure with updated values.
 */
CGRect  CGRectSetWidth(CGRect rect, CGFloat width);

/**
 * Creates and returns a CGRect structure from a receiver object and a new height.
 *
 * @param rect The original CGRect structure.
 * @param width A CGFloat value indicating the new height value.
 * @return A new CGRect structure with updated values.
 */
CGRect  CGRectSetHeight(CGRect rect, CGFloat height);

/**
 * Creates and returns a CGRect structure from a receiver object and a new x position.
 *
 * @param rect The original CGRect structure.
 * @param width A CGFloat value indicating the new x position value.
 * @return A new CGRect structure with updated values.
 */
CGRect  CGRectSetX(CGRect rect, CGFloat x);

/**
 * Creates and returns a CGRect structure from a receiver object and a new y position.
 *
 * @param rect The original CGRect structure.
 * @param width A CGFloat value indicating the new y position value.
 * @return A new CGRect structure with updated values.
 */
CGRect  CGRectSetY(CGRect rect, CGFloat y);

/**
 * Creates and returns a CGRect structure from a receiver object and a new size.
 *
 * @param rect The original CGRect structure.
 * @param width A CGSize value indicating the new size value.
 * @return A new CGRect structure with updated values.
 */
CGRect  CGRectSetSize(CGRect rect, CGSize size);

/**
 * Creates and returns a CGRect structure from a receiver object and a new origin.
 *
 * @param rect The original CGRect structure.
 * @param width A CGPoint value indicating the new origin value.
 * @return A new CGRect structure with updated values.
 */
CGRect  CGRectSetOrigin(CGRect rect, CGPoint origin);

#endif