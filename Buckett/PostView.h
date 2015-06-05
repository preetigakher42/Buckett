//
//  PostView.h
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostView : UIView
@property (strong, nonatomic) IBOutlet UIView *View;
@property (weak, nonatomic) IBOutlet UITextView *caption_textView;
@property (weak, nonatomic) IBOutlet UITextField *location_txt;
@property (weak, nonatomic) IBOutlet UITextField *People_txt;
- (IBAction)facebookClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *twitterClicked;
- (IBAction)instagram_Clicked:(id)sender;
- (IBAction)postClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Postbtn;
@property (weak, nonatomic) IBOutlet UIScrollView *PostScrollview;

@end
