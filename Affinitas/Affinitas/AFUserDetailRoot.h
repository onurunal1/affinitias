//
//  AFUserDetailRoot.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "AFUserDetail.h"

@interface AFUserDetailRoot : JSONModel
//This model collects JSON which is responded by calling with "action == detail" parameter
@property(nonatomic) BOOL success;
@property(nonatomic) AFUserDetail *data;


@end
