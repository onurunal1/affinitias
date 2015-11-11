//
//  AFUserRoot.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "AFUsers.h"

@interface AFUserRoot : JSONModel

@property(nonatomic) BOOL success;
@property(nonatomic) NSArray<AFUsers*> *data;


@end
