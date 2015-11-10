//
//  NSOperationQueue+DKHelper.h
//
//
//  Created by Pierre Rothmaler on 30/09/15.
//  Copyright (c) 2015 Smart Mobile Factory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationQueue (DKHelper)

/**
 * Wraps the specified block in an operation object and adds it to the receiver. If the given time passed the operation will get cancelled and the timeoutBlock gets called.
 *
 * @discussion make sure to check whether the operation is cancelled in your execution block
 *
 * @param block The block to execute from the operation object.
 * @param timeout Timeout after that the operation should be cancelled
 * @param timeoutBlock The block that gets called after the operation timed out
 * @return The NSOperation.
 */
- (NSOperation *)addOperationWithBlock:(void (^)(NSOperation *operation))block timeout:(NSTimeInterval)timeout timeoutBlock:(void (^)(void))timeoutBlock;

@end
