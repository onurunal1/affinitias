//
//  NSObject+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_NSObject_h__
#define DKHelper_NSObject_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of NSObject to add a bunch of helping methods.
 */
@interface NSObject (Block)

#pragma mark - NSObject+Block

/**
 * Performs a code block after a given delay.
 *
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 */
- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(void (^)(void))block;

/**
 * Performs a code block on a background thread.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 */
- (void)performBlockInBackground:(void (^)(void))block;

/**
 * Performs a code block on a background thread and call a completion block when it's done.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed.
 */
- (void)performBlockInBackground:(void (^)(void))block completion:(void (^)(void))completionBlock;

/**
 * Performs a code block after a given delay and call a completion block when it's done.
 *
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed.
 */
- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(void (^)(void))block completion:(void (^)(void))completionBlock;

/**
 * Performs a code block and call a completion block when it's done.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed.
 */
- (void)performBlock:(void (^)(void))block completion:(void (^)(void))completionBlock;

#pragma mark - Deprecated

/**
 * Performs a code block after a given delay and call a completion block when it's done.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed.
 */
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay completion:(void (^)(void))completionBlock __attribute__((deprecated));


/**
 * Performs a code block after a given delay.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 */
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay __attribute__((deprecated));

@end

#endif