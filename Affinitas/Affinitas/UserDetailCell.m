//
//  UserDetailCell.m
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserDetailCell.h"
#import "AFUserDetail.h"

#define K_CELL  @"UserDetailCell"


@implementation UserDetailCell{
    UITableViewController *_viewController;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithCustomNibAndController:(UITableViewController *)controller _user:(AFUserDetail*)user{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:K_CELL];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:K_CELL owner:self options:nil];
        self = nib[0];
        _viewController = controller;
        DKLog(K_VERBOSE_MOBILE_API_JSON, @"User List --> {%@}",user);
    }
    return  self;
}


- (IBAction)PreviousImage:(id)sender {
}

- (IBAction)NextImage:(id)sender {
}
@end
