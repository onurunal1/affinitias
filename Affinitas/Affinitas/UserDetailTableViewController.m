//
//  UserDetailTableViewController.m
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserDetailTableViewController.h"
#import "AFUserDetailRoot.h"
#import "UserDetailCell.h"
#import "UserImageViewController.h"

#define K_USER_DETAIL_CELL                @"UserDetailCell"

@interface UserDetailTableViewController (){
    UIStoryboard *sb;
}
@end

@implementation UserDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sb = [UIStoryboard storyboardWithName:K_STORYBOARD bundle:[NSBundle mainBundle]];
    self.title = [self.userDetailList.data valueForKey:JSON_FIRSTNAME];
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  505;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserDetailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:K_USER_DETAIL_CELL];
    if (!cell)
        cell = [[UserDetailCell alloc] initWithCustomNibAndController:self detail:self.userDetailList.data];
    cell.delegate = self;
    return  cell;
}

#pragma mark - UserDetailCell Delegate

-(void)didImageGaleryClicked:(NSURL *)imageURL{
    UserImageViewController *galleryView = [sb instantiateViewControllerWithIdentifier:K_IMAGE_SLIDER_ID];
    galleryView.sImage = imageURL;
    [self.navigationController pushViewController:galleryView animated:YES];
}

@end
