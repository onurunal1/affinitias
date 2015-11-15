//
//  UserDetailTableViewController.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFUserDetailRoot.h"
#import "UserDetailCell.h"

@interface UserDetailTableViewController : UITableViewController <UserDetailCellDelegate>

@property (strong, nonatomic) NSString *userId;
@property (nonatomic,strong) AFUserDetailRoot *userDetailList;


@end
