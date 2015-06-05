//
//  PostWishViewController.h
//  Buckett
//
//  Created by Anmol Rajdev on 02/06/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkManager.h"
@interface PostWishViewController : UIViewController<UITextViewDelegate,networkManagerdelegate>
- (IBAction)backClicked:(id)sender;

- (IBAction)nextClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *PostTextView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
