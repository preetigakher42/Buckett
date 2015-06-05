//
//  RegisterViewController.h
//  Buckett
//
//  Created by Anmol Rajdev on 19/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *emailTextfeild;
@property (weak, nonatomic) IBOutlet UITextField *usernametextfeild;
@property (weak, nonatomic) IBOutlet UITextField *passwordtextfeild;
@property (weak, nonatomic) IBOutlet UIButton *registerbtn;
@property (weak, nonatomic) IBOutlet UITextField *confirmpwtextfeild;
- (IBAction)registerClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backtologinClicked;
- (IBAction)backtoLoginClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
