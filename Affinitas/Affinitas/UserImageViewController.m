//
//  UserImageViewController.m
//  Affinitas
//
//  Created by OnurMac on 11/13/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserImageViewController.h"

@interface UserImageViewController ()

@end

@implementation UserImageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imgUser sd_setImageWithURL:self.sImage];
    self.title = @"Photo";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
