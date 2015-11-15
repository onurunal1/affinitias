//
//  UserDetailGaleryCell.m
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserDetailGaleryCell.h"

#define K_CELL_GALERY   @"UserDetailGaleryCell"

@implementation UserDetailGaleryCell

- (void)awakeFromNib {
    // Initialization code
    self.kThumbImage.layer.shadowColor = [UIColor blackColor].CGColor;
    self.kThumbImage.layer.shadowOffset = CGSizeMake(0, 1);
    self.kThumbImage.layer.shadowOpacity = 1;
    self.kThumbImage.layer.shadowRadius = 1.0;
    self.kThumbImage.clipsToBounds = NO;
    self.kThumbImage.contentMode = UIViewContentModeScaleAspectFit;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"UserDetailGaleryCell" owner:self options:nil];
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

@end
