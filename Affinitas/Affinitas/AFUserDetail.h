//
//  AFUserDetail.h
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface AFUserDetail : JSONModel

@property(nonatomic) NSString* id;
@property(nonatomic) NSString* firstname;
@property(nonatomic) NSString* name;
@property(nonatomic) NSString* image_url;
@property(nonatomic) NSNumber* age;
@property(nonatomic) NSString* city;
@property(nonatomic) NSArray* images;
@property(nonatomic) NSNumber* total_images;
@property(nonatomic) NSString* postcode;
@property(nonatomic) NSString* job;
@property(nonatomic) BOOL smoker;
@property(nonatomic) BOOL wish_for_children;

@end
