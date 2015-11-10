//
//  UserListCell.m
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserListCell.h"

@implementation UserListCell{
    UITableViewController *_viewController;
}

#define K_CELL  @"UserListCell"

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithCustomNibAndController:(UITableViewController *)controller _array:(NSMutableArray*)_array{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:K_CELL];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:K_CELL owner:self options:nil];
        self = nib[0];
        _viewController = controller;
        DKLog(K_VERBOSE_MOBILE_API_JSON, @"Info Question --> {%@}",_array);
    }
    return  self;
}

- (void)setUserName{
   
}
- (void)setUserAge{
    
}
- (void)setUserLocation{
    
}
- (void)setUserImage{
    
}



@end
