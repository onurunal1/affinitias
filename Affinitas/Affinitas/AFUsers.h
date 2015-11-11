//
//  AFUsers.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface AFUsers : JSONModel

@property(nonatomic) NSString* _id;
@property(nonatomic) NSString* firstname;
@property(nonatomic) NSString* image_url;
@property(nonatomic) NSNumber* age;
@property(nonatomic) NSString* city;
@property(nonatomic) NSNumber* total_images;

@end
