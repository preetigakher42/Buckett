//
//  LoginViewController.h
//  Buckett
//
//  Created by Anmol Rajdev on 19/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkManager.h"
@interface LoginViewController : UIViewController<networkManagerdelegate>
- (IBAction)facebookClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfeild;
@property (weak, nonatomic) IBOutlet UITextField *passwordTExtfeild;
@property (weak, nonatomic) IBOutlet UIButton *loginbtn;
- (IBAction)loginClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *forgotClicked;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
- (IBAction)forgotClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *facebookClicked;
- (IBAction)SignUpAccountClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)postClicked:(id)sender;

@end
