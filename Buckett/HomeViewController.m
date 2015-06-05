//
//  HomeViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 27/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
{
    NSArray *revieArray;
    NSArray *loactionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _PostListView.estimatedRowHeight=576;
    self.PostListView.rowHeight = UITableViewAutomaticDimension;
    
    revieArray = [[NSArray alloc]initWithObjects:@"DGHFVEHJWDGEHWDJKEWHDJKEWHDJKEGWDGWDGEWJKDGEJKWHDJKHEWJKDHK",@"BDHJEWVGDBEWHJBDEWHJBDEHJWBDJKEWBDJKEWBNDJKBEJKDBEJKBDEJKWBDEJKWGIU4GIUEGFDWCHJDGCEWGDKEBDGEWDEIU2BDJKEWGDIUEGWDIU3434EJKB3DEU3DO8EY4D",@"DGHFVEHJWDGEHWDJKEWHDJKEWHDJKEGWDGWDGEWJKDGEJKWHDJKHEWJKDHK",@"DGHFVEHJWDGEHWDJKEWHDJKEWHDJKEGWDGWDGEWJKDGEJKWHDJKHEWJKDHK",@"DGHFVEHJWDGEHWDJKEWHDJKEWHDJKEGWDGWDGEWJKDGEJKWHDJKHEWJKDHK",@"DGHFVEHJWDGEHWDJKEWHDJKEWHDJKEGWDGWDGEWJKDGEJKWHDJKHEWJKDHK", nil];
    
    loactionArray = [[NSArray alloc]initWithObjects:@"DGHFVEHJWDGEHWDJKEWHDJKEWHDJKEGWDGWDGEWJKDGEJKWHDJKHEWJKDHK",@"BDHJEWVGDBEWHJBDEWHJBDEHJWBDJKEWBDJKEWBNDJKBEJKDBEJKBDEJKWBDEJKWGIU4GIUEGFDWCHJDGCEWGDKEBDGEWDEIU2BDJKEWGDIUEGWDIU3434EJKB3DEU3DO8EY4Dhjjjjjjkjhjmnb jmnnjmjnjnnjmjmjmj", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    UILabel * revLabel = (UILabel *)[cell viewWithTag:1];
    revLabel.text=[revieArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

-(IBAction)backClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
