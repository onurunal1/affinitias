//
//  NSPredicate+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSPredicate+DKHelper.h"

@implementation NSPredicate (DKHelper)

- (NSPredicate *)OR:(NSPredicate *)predicate {
    if (!predicate) {
        return self;
    }
    return [NSCompoundPredicate orPredicateWithSubpredicates:@[self, predicate]];
}

- (NSPredicate *)AND:(NSPredicate *)predicate {
    if (!predicate) {
        return self;
    }
    return [NSCompoundPredicate andPredicateWithSubpredicates:@[self, predicate]];
}

@end
