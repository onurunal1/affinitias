//
//  NSPredicate+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A categorized class of NSPredicate to add a bunch of helping methods.
 */
@interface NSPredicate (DKHelper)

/**
 * Returns a predicate applying a 'OR' logic on the current object with the given parameter.
 *
 * @param predicate The predicate to apply to the current object. If nil, only the current object will be returned.
 * @return A predicate object.
 */
- (NSPredicate *)OR:(NSPredicate *)predicate;

/**
 * Returns a predicate applying a 'AND' logic on the current object with the given parameter.
 *
 * @param predicate The predicate to apply to the current object. If nil, only the current object will be returned.
 * @return A predicate object.
 */
- (NSPredicate *)AND:(NSPredicate *)predicate;

@end
