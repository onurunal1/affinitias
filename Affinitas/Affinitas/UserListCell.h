//
//  UserListCell.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *kUserImage;
@property (weak, nonatomic) IBOutlet UILabel *kUserName;
@property (weak, nonatomic) IBOutlet UILabel *kUserAge;
@property (weak, nonatomic) IBOutlet UILabel *kUserCity;

- (instancetype)initWithCustomNibAndController:(UITableViewController *)controller _array:(NSMutableArray*)_array;

@end
