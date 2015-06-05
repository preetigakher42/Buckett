//
//  EditcontentView.m
//  Buckett
//
//  Created by Anmol Rajdev on 22/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "EditcontentView.h"
#import "NetworkManager.h"
#import "User.h"
@implementation EditcontentView{
    NetworkManager *manager;
    User *user;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    self =[super init];
    if (self) {
       
        self.view = [[[NSBundle mainBundle] loadNibNamed:@"EditcontentView" owner:self options:nil] firstObject];
        [self addSubview:self.view];
        [self makingRoundCorners:_updateBtn.layer :15];
        
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = YES;
        manager =[[NetworkManager alloc]init];
        user=[[User alloc]init];
        
        [self makingRoundCorners:_editPwBtn.layer :10];
        
      //  _confirmPasswordview_topspaceConstraint.constant=0;
       // _confirmPassword_height_constraint.constant=0;
        
        
    }
   


    return self;
}

#pragma mark rounding layer

-(void)makingRoundCorners:(CALayer *)layer :(CGFloat)radius
{
    layer.borderColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.3].CGColor;
    layer.borderWidth = 1.0f;
    layer.cornerRadius = radius;
}

- (IBAction)EditImageClicked:(id)sender {
//    UIButton *bgbtn=(UIButton *)sender;
    
    [self.delegate imageUploadClicked:sender];
}

-(IBAction)ProImgpickerClicked:(id)sender{
    [self.delegate imageUploadClicked:sender];
}
- (IBAction)editPassClicked:(id)sender {
    
    
    _confirmPasswordview_topspaceConstraint.constant=9;
    _confirmPassword_height_constraint.constant=40;
    [_confirmPassword_View setNeedsUpdateConstraints];
    
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_confirmPassword_View layoutIfNeeded];
       
    } completion:^(BOOL finished) {
      
       
    }];
   
    
    
//    else{
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
//                                                        message:@"Passwords do not match."
//                                                       delegate:self
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//
//    }

    
}
-(IBAction)UpdateProfileClicked:(id)sender{
    user.email =_emailTextfeild.text;
    user.username =_usernameTextfeild.text;
   // user.password =_passwordtextfeild.text;
    user.user_location=_locationTextfeild.text;
    user.user_bio=_bioTextview.text;
    user.phone =_phoneTextfeild.text;
    user.user_image=_profileImageView.image;
    user.cover_image=_bgImgView.image;
    if (![_passwordtextfeild.text isEqualToString:_confirmPasswordTextField.text]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                                message:@"Passwords do not match."
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];

        
    }
    else{

    [manager UpdateProfileViaUser:user :_profileImageView.image :_bgImgView.image];
    
    }
}

#pragma mark textField Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark touch event method

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_usernameTextfeild resignFirstResponder];
    
    [_passwordtextfeild resignFirstResponder];
    
    [_emailTextfeild resignFirstResponder];
    [_locationTextfeild resignFirstResponder];
    [_bioTextview resignFirstResponder];
    [_phoneTextfeild resignFirstResponder];
}

#pragma mark Keyboard code



- (void)keyboardWillShow:(NSNotification *)notification

{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect f = self.view.frame;
        
        f.origin.y = -100.0f;  //set the -35.0f to your required value
        
        self.view.frame = f;
        
    }];
    
    
    
}



-(void)keyboardWillHide:(NSNotification *)notification

{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect f = self.view.frame;
        
        f.origin.y = 0.0f;
        
        self.view.frame = f;
        
    }];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
   
}
-(void)Editsucess:(NSDictionary *)response{
    
    
}

@end
