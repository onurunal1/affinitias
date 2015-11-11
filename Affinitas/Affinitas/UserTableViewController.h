//
//  UserTableViewController.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFUsers.h"
#import "AFUserRoot.h"

@interface UserTableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) AFUserRoot *userList;

@end
