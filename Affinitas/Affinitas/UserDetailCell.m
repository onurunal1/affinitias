//
//  UserDetailCell.m
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserDetailCell.h"
#import "AFUserDetail.h"
#import "AFUserDetailRoot.h"
#import "UserDetailGaleryCell.h"
#import "UserImageViewController.h"

#define K_CELL          @"UserDetailCell"
#define K_CELL_GALERY   @"UserDetailGaleryCell"


@implementation UserDetailCell{
    UITableViewController *_viewController;
    NSArray *userImages;
}

- (void)awakeFromNib {
    // Make it round
    self.kUserImage.contentMode = UIViewContentModeScaleAspectFill;
    self.kUserImage.layer.cornerRadius =self.kUserImage.frame.size.height/2;
    self.kUserImage.layer.masksToBounds = YES;
    self.kUserImage.layer.borderColor = [UIColor whiteColor].CGColor;
    self.kUserImage.layer.borderWidth=2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithCustomNibAndController:(UITableViewController *)controller detail:(AFUserDetail*)detail{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:K_CELL];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:K_CELL owner:self options:nil];
        self = nib[0];
        _viewController = controller;
        DKLog(K_VERBOSE_MOBILE_API_JSON, @"User Detail --> {%@}",detail);
        [self.collectionView registerClass:[UserDetailGaleryCell class] forCellWithReuseIdentifier:K_CELL_GALERY];
        userImages = [detail valueForKey:@"images"];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self setValueForCell:detail];
    }
    return  self;
}

-(void)setValueForCell:(AFUserDetail*)detail{
    self.kCityPostcode.text = [NSString stringWithFormat:@"%@, %@",[detail valueForKey:JSON_CITY],[detail valueForKey:JSON_POSTCODE]];
    self.kJobTitle.text = [detail valueForKey:JSON_JOB];
    self.KSmokeUser.text = [self isFlag:(BOOL)[detail valueForKey:JSON_SMOKER]];
    self.kWishForChildren.text = [self isFlag:(BOOL)[detail valueForKey:JSON_WISH_FOR]];
    self.kFirstNameAge.text = [NSString stringWithFormat:@"%@, %@",[detail valueForKey:JSON_NAME],[detail valueForKey:JSON_AGE]];
    [self.kUserImage sd_setImageWithURL:[self replaceURL:[detail valueForKey:@"image_url"]]];
}

-(NSURL*)replaceURL:(NSString*)url{
    return [NSURL URLWithString:[url stringByReplacingOccurrencesOfString:@"/profiles.php" withString:@""]];
}

-(NSString*)isFlag:(BOOL)flag{
    if (flag) {
        return @"Yes";
    }else{return @"No";}
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return userImages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UserDetailGaleryCell *cell = (UserDetailGaleryCell *)[collectionView dequeueReusableCellWithReuseIdentifier:K_CELL_GALERY forIndexPath:indexPath];
    [cell.kThumbImage sd_setImageWithURL:[self replaceURL:(NSString*)userImages[indexPath.row]]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate didImageGaleryClicked:[self replaceURL:(NSString*)userImages[indexPath.row]]];
}


@end
