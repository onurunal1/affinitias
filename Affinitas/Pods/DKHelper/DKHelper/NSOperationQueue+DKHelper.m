//
//  NSOperationQueue+DKHelper.m
//
//
//  Created by Pierre Rothmaler on 30/09/15.
//  Copyright (c) 2015 Smart Mobile Factory. All rights reserved.
//

#import "NSOperationQueue+DKHelper.h"

@implementation NSOperationQueue (DKHelper)

- (NSOperation *)addOperationWithBlock:(void (^)(NSOperation *operation))block timeout:(NSTimeInterval)timeout timeoutBlock:(void (^)(void))timeoutBlock {
	NSBlockOperation *blockOperation = [[NSBlockOperation alloc] init];
	NSBlockOperation __weak *weakOperation = blockOperation;

	[blockOperation addExecutionBlock:^{
		block(weakOperation);
	}];

	[self addOperation:blockOperation];

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		if (weakOperation && ![weakOperation isFinished]) {
			[weakOperation cancel];
			if (timeoutBlock) {
				timeoutBlock();
			}
		}
	});

	return blockOperation;
}

@end
