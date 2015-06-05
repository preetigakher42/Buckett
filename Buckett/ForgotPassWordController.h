//
//  ForgotPassWordController.h
//  Buckett
//
//  Created by Anmol Rajdev on 19/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkManager.h"
@interface ForgotPassWordController : UIViewController<networkManagerdelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailtextfeild;
- (IBAction)submitClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitbtn;
- (IBAction)backtoLoginClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
