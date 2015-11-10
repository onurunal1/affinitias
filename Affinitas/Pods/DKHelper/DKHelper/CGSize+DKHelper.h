//
//  CGSize+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_CGSize_h__
#define DKHelper_CGSize_h__

/**
 * Returns a new CGSize structure corresponding to a size adjusted into a CGRect container.
 *
 * @discussion The ratio of the original size is conserved.
 *
 * @param size The size to adjust
 * @param rect The container's frame into which the given frame has to be adjusted.
 * @return A new CGSize structure.
 */
CGSize CGSizeAdjustToCGRect(CGSize size, CGRect rect);

/**
 * Returns a new CGSize structure corresponding to a size adjusted to another CGSize value.
 *
 * @discussion The ratio of the original size is conserved.
 *
 * @param size The size to adjust
 * @param rSize The destination size for which the original size has to be adjusted.
 * @return A new CGSize structure.
 */
CGSize CGSizeAdjustToCGSize(CGSize size, CGSize rSize);

#endif