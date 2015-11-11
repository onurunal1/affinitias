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

#define K_USER_DETAIL_CELL                @"UserDetailCell"

@interface UserDetailTableViewController ()

@end

@implementation UserDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
}

-(void)fetchData{
    [[AFMobileApiManager sharedClient] getUserDetailWithCompletion:self.userId errBlock:^(id response) {
        [self setData:response];
    } error:^(NSError *error) {
        NSLog(@"Err : %@",error.description);
    }];
}

-(void)setData:(AFUserDetailRoot*)instance{
    self.userDetailList = instance;
   [self.tableView reloadData];
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
    return  500;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserDetailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:K_USER_DETAIL_CELL];
    if (!cell)
        cell = [[UserDetailCell alloc] initWithCustomNibAndController:self _user:self.userDetailList];
    return  cell;
}
@end
