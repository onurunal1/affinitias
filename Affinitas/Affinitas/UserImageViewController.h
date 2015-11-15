//
//  UserImageViewController.h
//  Affinitas
//
//  Created by OnurMac on 11/13/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface UserImageViewController : UIViewController

@property (nonatomic,strong) NSURL *sImage;
@property (weak, nonatomic) IBOutlet UIImageView *imgUser;

@end
