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
        cell = [[UserDetailCell alloc] initWithCustomNibAndController:self detail:self.userDetailList.data];
    cell.kName.text = [self.userDetailList.data valueForKey:@"name"];
    cell.kCityPostcode.text = [NSString stringWithFormat:@"%@, %@",[self.userDetailList.data valueForKey:@"city"],[self.userDetailList.data valueForKey:@"postcode"]];
    cell.kJobTitle.text = [self.userDetailList.data valueForKey:@"job"];
    cell.KSmokeUser.text = [self isFlag:(BOOL)[self.userDetailList.data valueForKey:@"job"]];
    cell.kWishForChildren.text = [self isFlag:(BOOL)[self.userDetailList.data valueForKey:@"job"]];
    cell.kFirstNameAge.text = [NSString stringWithFormat:@"%@, %@",[self.userDetailList.data valueForKey:@"firstname"],[self.userDetailList.data valueForKey:@"age"]];
    [cell.kUserImage sd_setImageWithURL:[self replaceURL:[self.userDetailList.data valueForKey:@"image_url"]]];
    return  cell;
}

-(NSURL*)replaceURL:(NSString*)url{
    return [NSURL URLWithString:[url stringByReplacingOccurrencesOfString:@"/profiles.php" withString:@""]];
}

-(NSString*)isFlag:(BOOL)flag{
    if (flag) {
        return @"Yes";
    }else{return @"No";}
}



@end
