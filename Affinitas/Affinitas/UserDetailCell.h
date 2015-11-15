//
//  UserDetailCell.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KASlideShow.h"
#import "AFUserDetail.h"
#import "AFUserDetailRoot.h"
#import <SDWebImage/UIImageView+WebCache.h>

@protocol UserDetailCellDelegate <NSObject>
-(void)didImageGaleryClicked:(NSURL*)imageURL;
@end

@interface UserDetailCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

- (instancetype)initWithCustomNibAndController:(UITableViewController *)controller detail:(AFUserDetail*)detail;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *kFirstNameAge;
@property (weak, nonatomic) IBOutlet UILabel *kName;
@property (weak, nonatomic) IBOutlet UILabel *kCityPostcode;
@property (weak, nonatomic) IBOutlet UILabel *kJobTitle;
@property (weak, nonatomic) IBOutlet UILabel *KSmokeUser;
@property (weak, nonatomic) IBOutlet UILabel *kWishForChildren;
@property (weak, nonatomic) IBOutlet UIImageView *kUserImage;
@property (weak, nonatomic)  id<UserDetailCellDelegate> delegate;

@end
