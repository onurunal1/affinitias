//
//  UserDetailCell.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KASlideShow.h"

@interface UserDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet KASlideShow *slideShow;

- (IBAction)PreviousImage:(id)sender;
- (IBAction)NextImage:(id)sender;

@end
