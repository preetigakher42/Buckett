//
//  RegisterViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 19/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "RegisterViewController.h"
#import "ForgotPassWordController.h"
#import "ProfileViewController.h"
#import "Validations.h"
#import "NetworkManager.h"
#import "User.h"
#import "MBProgressHUD.h"
#import "HomeViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController
{
    Validations *validate;
    User *user;
    NetworkManager *manager;
    NSDictionary *responseArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    validate =[[Validations alloc]init];
    user =[[User alloc]init];
    manager=[[NetworkManager alloc]init];
    manager.delegate=self;
    // Do any additional setup after loading the view.
    [self makingRoundCorners:_registerbtn.layer :15];
    
    /*********hide status bar************/
     [[UIApplication sharedApplication] setStatusBarHidden:YES];
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
#pragma mark rounding layer

-(void)makingRoundCorners:(CALayer *)layer :(CGFloat)radius
{
    layer.borderColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.3].CGColor;
    layer.borderWidth = 1.0f;
    layer.cornerRadius = radius;
}
- (IBAction)registerClicked:(id)sender {
    
    if ([_usernametextfeild.text isEqualToString:@""]||[_passwordtextfeild.text isEqualToString:@""]||[_confirmpwtextfeild.text isEqualToString:@""]||[_emailTextfeild.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Please fill required feilds."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }

    
  else if(![validate NSStringIsValidEmail:_emailTextfeild.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Please Enter Valid Email Address First."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
   else if  (![validate NSStringIsValidPassword:_passwordtextfeild.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Please Enter minimum 6 characters."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
else if (![_passwordtextfeild.text isEqualToString:_confirmpwtextfeild.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Passwords do not match."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
else if (![validate validateUsername:_usernametextfeild.text]){
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                    message:@"Please Enter Valid Username First"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}
    else{
        
        user.username =_usernametextfeild.text;
        user.password =_passwordtextfeild.text;
        user.email =_emailTextfeild.text;
        [_activityIndicator startAnimating];
        [manager RegisterUserViaLogin:user];

//        ProfileViewController *Pvc =[self.storyboard instantiateViewControllerWithIdentifier:@"profileView"];
//        [self.navigationController pushViewController:Pvc animated:YES];
  
    }
    
}
- (IBAction)backtoLoginClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

# pragma mark Network manager Delegates
-(void)Registersuccess:(NSDictionary *)Regresponse{
     NSLog(@"response in register View %@",Regresponse);
    [_activityIndicator stopAnimating];
        NSNumber * isSuccessNumber = (NSNumber *)[Regresponse objectForKey: @"status"];
    responseArray=Regresponse;
    NSString *alreadyuser=[Regresponse objectForKey:@"msg"];
  

    if([isSuccessNumber boolValue] == YES)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = alreadyuser;
        hud.margin = 7.f;
        hud.yOffset = 120.f;
        hud.removeFromSuperViewOnHide = YES;
        hud.labelFont =[UIFont systemFontOfSize:15];

        [hud hide:YES afterDelay:2];
        HomeViewController *homeVc=[self.storyboard instantiateViewControllerWithIdentifier:@"homeView"];
//        homeVc.EditDict=responseArray;
        [self.navigationController pushViewController:homeVc animated:YES];
//        [self.navigationController popViewControllerAnimated:YES];
       

    }
        else
    {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = alreadyuser;
        hud.margin = 7.f;
        hud.yOffset = 120.f;
        hud.labelFont =[UIFont systemFontOfSize:15];

        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
    
}

-(void)errorResponse{
    NSLog(@"error received");
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"Invalid details.";
    hud.margin = 10.f;
    hud.yOffset = 120.f;
    hud.labelFont =[UIFont systemFontOfSize:13];

    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:2];

}

#pragma mark textField Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark touch event method

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_usernametextfeild resignFirstResponder];
    
    [_passwordtextfeild resignFirstResponder];
    [_emailTextfeild resignFirstResponder];
     [_confirmpwtextfeild resignFirstResponder];

    
    
    
}

#pragma mark Keyboard code

- (void)viewWillAppear:(BOOL)animated {
    
 
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}


- (void)keyboardWillShow:(NSNotification *)notification

{
    
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect f = self.view.frame;
            
            f.origin.y = -80.0f;  //set the -35.0f to your required value
            
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

@end
