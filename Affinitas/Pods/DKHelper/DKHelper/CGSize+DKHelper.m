//
//  CGSize+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "CGSize+DKHelper.h"

CGSize CGSizeAdjustToCGRect(CGSize size, CGRect rect) {
    CGFloat w = size.width;
    CGFloat h = size.height;

    if (w > rect.size.width) {
        h = h / (w / rect.size.width);
        w = rect.size.width;
    }
    if (h > rect.size.height) {
        w = w / (h / rect.size.height);
        h = rect.size.height;
    }
    return CGSizeMake(w, h);
}

CGSize CGSizeAdjustToCGSize(CGSize size, CGSize rSize) {
    CGFloat w = size.width / rSize.width;
    CGFloat h = rSize.height * w;
    w *= rSize.width;

    return CGSizeMake(w, h);
}
