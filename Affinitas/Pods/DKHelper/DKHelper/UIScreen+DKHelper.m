//
//  UIScreen+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIScreen+DKHelper.h"

@implementation UIScreen (DKHelper)

+ (BOOL)is35InchScreen {
    return ([UIScreen mainScreen].bounds.size.height == 480. && [UIScreen mainScreen].bounds.size.width == 320.);
}

+ (BOOL)is4InchScreen {
    return ([UIScreen mainScreen].bounds.size.height == 568. && [UIScreen mainScreen].bounds.size.width == 320.);
}

+ (BOOL)is47InchScreen {
    return ([UIScreen mainScreen].bounds.size.height == 667. && [UIScreen mainScreen].bounds.size.width == 375.);
}

+ (BOOL)is55InchScreen {
    return ([UIScreen mainScreen].bounds.size.height == 960. && [UIScreen mainScreen].bounds.size.width == 540.);
}

@end
