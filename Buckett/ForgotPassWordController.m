//
//  ForgotPassWordController.m
//  Buckett
//
//  Created by Anmol Rajdev on 19/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "ForgotPassWordController.h"
#import "EditProfileViewController.h"
#import "Validations.h"
#import "MBProgressHUD.h"
#import "NetworkManager.h"
#import "User.h"
@interface ForgotPassWordController ()

@end

@implementation ForgotPassWordController{
    Validations *validate;
    NetworkManager *manager;
    User *user;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    validate =[[Validations alloc]init];
    manager =[[NetworkManager alloc]init];
    manager.delegate=self;
    user=[[User alloc]init];
    [self makingRoundCorners:_submitbtn.layer :15];
    
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

- (IBAction)submitClicked:(id)sender {
    if (![validate NSStringIsValidEmail:_emailtextfeild.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Please Enter valid email address."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        user.email=_emailtextfeild.text;
        [_activityIndicator startAnimating];
        [manager ForgotPasswordViaUser:user];
    }
}
- (IBAction)backtoLoginClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

# pragma mark Network manager Delegates

-(void)Forgotsuccess:(NSDictionary *)response{
    
    NSLog(@"response in register View %@",response);
    [_activityIndicator stopAnimating];
    NSString *msgString=[response valueForKey:@"msg"];
    NSNumber * isSuccessNumber = (NSNumber *)[response objectForKey: @"status"];
    if([isSuccessNumber boolValue] == YES)
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = msgString;
        hud.margin = 10.f;
        hud.yOffset = -70.f;
        hud.labelFont =[UIFont systemFontOfSize:13];
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
        [self performSelector:@selector(popVC) withObject:nil afterDelay:2];
    }
    else{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = msgString;
        hud.margin = 10.f;
        hud.yOffset = -70.f;
        hud.labelFont =[UIFont systemFontOfSize:13];
        
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
        //        [self performSelector:@selector(popVC) withObject:nil afterDelay:2];
    }
    
}

-(void)errorResponse{
    NSLog(@"error received");
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"Error received.";
    hud.margin = 10.f;
    hud.yOffset = 120.f;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:2];
    [self performSelector:@selector(popVC) withObject:nil afterDelay:2];
}
#pragma mark textField Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark touch event method

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_emailtextfeild resignFirstResponder];
    
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.navigationController.navigationBarHidden=YES;
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

-(void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
