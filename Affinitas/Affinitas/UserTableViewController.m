//
//  UserTableViewController.m
//  Affinitas
//
//  Created by OnurMac on 11/11/15.
//  Copyright © 2015 Onur Unal. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserListCell.h"
#import "AFUsers.h"
#import "UserDetailTableViewController.h"

#define K_USER_CELL                @"UserListCell"

@interface UserTableViewController ()
@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
}

-(void)fetchData{
    [[AFMobileApiManager sharedClient] getUserListWithCompletion:^(id response) {
        [self setData:response];
    } error:^(NSError *error) {
        NSLog(@"Err : %@",error.description);
    }];
}

-(void)setData:(AFUserRoot*)instance{
    self.userList = instance;
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
    return self.userList.data.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:K_USER_CELL];
    if (!cell)
        cell = [[UserListCell alloc] initWithCustomNibAndController:self _user:self.userList.data[indexPath.row]];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* uID =[self.userList.data[indexPath.row] valueForKey:@"id"];
    UserDetailTableViewController *detailData = [[UserDetailTableViewController alloc] init];
    detailData.userId = uID;
    [self.navigationController pushViewController:detailData animated:YES];
}

@end
