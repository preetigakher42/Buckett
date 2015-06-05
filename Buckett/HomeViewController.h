//
//  HomeViewController.h
//  Buckett
//
//  Created by Anmol Rajdev on 27/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *PostListView;
-(IBAction)backClicked:(id)sender;

@end
