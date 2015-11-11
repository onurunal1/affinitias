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

#define K_CELL          @"UserDetailCell"
#define K_CELL_GALERY   @"UserDetailGaleryCell"


@implementation UserDetailCell{
    UITableViewController *_viewController;
    NSArray *userImages;
}

- (void)awakeFromNib {
    // Initialization code
    self.kUserImage.layer.shadowColor = [UIColor blackColor].CGColor;
    self.kUserImage.layer.shadowOffset = CGSizeMake(0, 1);
    self.kUserImage.layer.shadowOpacity = 1;
    self.kUserImage.layer.shadowRadius = 1.0;
    self.kUserImage.clipsToBounds = NO;
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
    self.kName.text = [detail valueForKey:@"name"];
    self.kCityPostcode.text = [NSString stringWithFormat:@"%@, %@",[detail valueForKey:@"city"],[detail valueForKey:@"postcode"]];
    self.kJobTitle.text = [detail valueForKey:@"job"];
    self.KSmokeUser.text = [self isFlag:(BOOL)[detail valueForKey:@"job"]];
    self.kWishForChildren.text = [self isFlag:(BOOL)[detail valueForKey:@"job"]];
    self.kFirstNameAge.text = [NSString stringWithFormat:@"%@, %@",[detail valueForKey:@"firstname"],[detail valueForKey:@"age"]];
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

@end
