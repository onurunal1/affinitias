//
//  UIImageView+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 5/10/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIImageView+DKHelper.h"

@implementation UIImageView (DKHelper)

- (instancetype)initWithImageNamed:(NSString *)imageName {
    return [self initWithImage:[UIImage imageNamed:imageName]];
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = image;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame imageNamed:(NSString *)imageName {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:imageName];
    }
    return self;
}

@end
