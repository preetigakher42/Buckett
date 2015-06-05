//
//  PostViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "PostViewController.h"
#import "PostView.h"
@interface PostViewController ()

@end

@implementation PostViewController
{
    PostView *post;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView * baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 672)];
    
    
    
    post =[[PostView alloc]init];
//    post.delegate=self;
     [_PostScrollView setContentSize:(CGSizeMake(self.view.frame.size.width,872))];
//    post.View.frame = CGRectMake(0, 0, self.view.frame.size.width, 378);
    [baseView addSubview:post.View];
    [_PostScrollView addSubview:baseView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
