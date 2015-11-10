//
//  CGRect+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "CGRect+DKHelper.h"

BOOL CGRectInsideContainer(CGRect frame, CGRect container) {
    return (
            (int)frame.origin.x >= (int)container.origin.x
            && ((int)frame.origin.x + (int)frame.size.width) <= ((int)container.size.width + (int)container.origin.x)
            && (int)frame.origin.y >= (int)container.origin.y
            && ((int)frame.origin.y + (int)frame.size.height) <= ((int)container.size.height + (int)container.origin.y)
            );
}

CGRect CGRectSetInsideContainer(CGRect frame, CGRect container) {

    if (frame.origin.x < container.origin.x)
        frame.origin.x = container.origin.x;
    else if ((frame.origin.x + frame.size.width) > (container.origin.x + container.size.width))
        frame.origin.x = (container.origin.x + container.size.width) - frame.size.width;

    if (frame.origin.y < container.origin.y)
        frame.origin.y = container.origin.y;
    else if ((frame.origin.y + frame.size.height) > (container.origin.y + container.size.height))
        frame.origin.y = (container.origin.y + container.size.height) - frame.size.height;

    return frame;
}

CGRect CGRectSetWidth(CGRect rect, CGFloat width) {
    return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}

CGRect CGRectSetHeight(CGRect rect, CGFloat height) {
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}

CGRect CGRectSetSize(CGRect rect, CGSize size) {
    return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

CGRect CGRectSetX(CGRect rect, CGFloat x) {
    return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height);
}

CGRect CGRectSetY(CGRect rect, CGFloat y) {
    return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}

CGRect CGRectSetOrigin(CGRect rect, CGPoint origin) {
    return CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
}