//
//  EditcontentView.h
//  Buckett
//
//  Created by Anmol Rajdev on 22/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkManager.h"
@protocol imageUpload <NSObject>

-(void)imageUploadClicked:(UIButton *)sender;

@end

@interface EditcontentView : UIView<networkManagerdelegate>
{
    id<imageUpload> delegate;
}
@property (weak, nonatomic) IBOutlet UIButton *EditBgBtn;

@property (weak, nonatomic) IBOutlet UIButton *editProBtn;
@property (weak, nonatomic) IBOutlet UITextField *emailTextfeild;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfeild;
@property (weak, nonatomic) IBOutlet UITextField *passwordtextfeild;
@property (weak, nonatomic) IBOutlet UITextField *locationTextfeild;
@property (weak, nonatomic) IBOutlet UITextView *bioTextview;


@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextfeild;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (retain) id<imageUpload> delegate;

@property (weak, nonatomic) IBOutlet UIButton *editPwBtn;
- (IBAction)editPassClicked:(id)sender;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *confirm_line_height_constraint;


@property (weak, nonatomic) IBOutlet UILabel *confirmPasswordLabel;

@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@property (weak, nonatomic) IBOutlet UILabel *confirmPassword_line;




@property (weak, nonatomic) IBOutlet UIView *confirmPassword_View;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *confirmPasswordview_topspaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *confirmPassword_height_constraint;



@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
-(IBAction)UpdateProfileClicked:(id)sender;
- (IBAction)ProImgpickerClicked:(id)sender;
@end
