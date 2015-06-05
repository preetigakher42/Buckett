//
//  LoginViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 19/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgotPassWordController.h"
#import "User.h"
#import "Validations.h"
#import "NetworkManager.h"
#import "PostViewController.h"
#import "HomeViewController.h"
#import "MBProgressHUD.h"
#import "EditProfileViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <AFNetworking.h>
#import "PostWishViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface LoginViewController ()

@end

@implementation LoginViewController{
    User *user;
    Validations *validate;
    NetworkManager *networkmanager;
    ACAccount * facebookAccount;
    ACAccountStore *accountStore;
    UIAlertView * settingalert;
    NSString * fbaccessToken;
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makingRoundCorners:_loginbtn.layer :_loginbtn.frame.size.height/2];
    validate =[[Validations alloc]init];
   networkmanager =[[NetworkManager alloc]init];
    networkmanager.delegate=self;
    user =[[User alloc]init];
//    user.email =@"ghakher.preeti03@gmail.com";
//    [user userDetail];
    
    NSLog(@"width of imageView ===%f   and  height of image view ===%f",_bgImageView.frame.size.width,_bgImageView.frame.size.height);
    
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
- (IBAction)loginClicked:(id)sender {
    
//    [networkmanager LoginViaUser:user];
    
    if ([_usernameTextfeild.text isEqualToString:@""]||[_passwordTExtfeild.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Please fill required feilds."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
   else if (![validate NSStringIsValidPassword:_passwordTExtfeild.text]){
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Please Enter Valid Range between 6 to 8."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
      
    }
    else{
        [self keyboardResign];
        [_activityIndicator startAnimating];
        // calling network manager delgate to login via email
        user.email =_usernameTextfeild.text;
        user.password =_passwordTExtfeild.text;
        
        [networkmanager LoginViaUser:user];
    }

   }
- (IBAction)forgotClicked:(id)sender {
    
    ForgotPassWordController *fpass =[self.storyboard instantiateViewControllerWithIdentifier:@"ForgotView"];
    [self.navigationController pushViewController:fpass animated:YES];
}
- (IBAction)SignUpAccountClicked:(id)sender {
    RegisterViewController *reg =[self.storyboard instantiateViewControllerWithIdentifier:@"registerView"];
    [self.navigationController pushViewController:reg animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.navigationController.navigationBarHidden=YES;
}
# pragma mark Network manager Delegates
-(void)loginsuccess:(NSDictionary *)response{
    NSLog(@"response in Login View %@",response);
    [_activityIndicator stopAnimating];
    
//    NSMutableDictionary *mutableRetrievedDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:@"user"] mutableCopy];
//    NSLog(@"%@",mutableRetrievedDictionary);
//    NSString *getAcessToken=[[mutableRetrievedDictionary objectForKey:@"user"]valueForKey:@"access_token"];
//    NSLog(@"%@",getAcessToken);
    
    
    NSNumber * isSuccessNumber = (NSNumber *)[response objectForKey: @"status"];
   NSString *alertmsg=[response valueForKey:@"msg"];
    if([isSuccessNumber boolValue] == YES)
    {
        // this is the YES case
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = alertmsg;
        hud.labelFont =[UIFont systemFontOfSize:14];
        hud.margin = 10.f;
        hud.yOffset = 100.f;
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
        [networkmanager saveInfo:response];
        NSString *getUser_Id=[[response objectForKey:@"user_data"]valueForKey:@"user_id"];
        NSLog(@"%@",getUser_Id);
        
        PostWishViewController *postVC =[self.storyboard instantiateViewControllerWithIdentifier:@"postwishView"];
        [self.navigationController pushViewController:postVC animated:YES];
       

    } else {
        NSLog(@"error");
         NSString *alertmsgerror=[response valueForKey:@"error"];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = alertmsgerror;
        hud.labelFont =[UIFont systemFontOfSize:13];
        hud.margin = 10.f;
        hud.yOffset = -70.f;
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];

    }
    
    
    
}
-(void)errorResponse{
    NSLog(@"error received");
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
    
    [_passwordTExtfeild resignFirstResponder];
    
    
    
}

#pragma mark Keyboard code



- (void)keyboardWillShow:(NSNotification *)notification

{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect f = self.view.frame;
        
        f.origin.y = -70.0f;  //set the -35.0f to your required value
        
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
#pragma  facebook integration
-(void)facebook
{
    
    NSLog(@"%@", [FBSDKAccessToken currentAccessToken].tokenString);
    if ([FBSDKAccessToken currentAccessToken].tokenString.length==0) {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
            if (error) {
                // Process error
            } else if (result.isCancelled) {
                // Handle cancellations
            } else {
                // If you ask for multiple permissions at once, you
                // should check if specific permissions missing
                if ([result.grantedPermissions containsObject:@"email"]) {
                    // Do work
                    NSLog(@"%@", result.token.tokenString);
                    [self get];
                }
            }
        }];
        
    }else{
        [self get];
    }
}



-(void)get
{
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 
                
                 [networkmanager faceBookviaUser:[result valueForKey:@"email"]:[result valueForKey:@"id"]];
             }
         }];
    }
}




-(void)accountChanged:(NSNotification *)notification
{
    [self attemptRenewCredentials];
}

-(void)attemptRenewCredentials
{
    [accountStore renewCredentialsForAccount:(ACAccount *)facebookAccount completion:^(ACAccountCredentialRenewResult renewResult, NSError *error){
        if(!error)
        {
            switch (renewResult) {
                case ACAccountCredentialRenewResultRenewed:
                    NSLog(@"Good to go");
                    [self get];
                    break;
                case ACAccountCredentialRenewResultRejected:
                    NSLog(@"User declined permission");
                    break;
                case ACAccountCredentialRenewResultFailed:
                    NSLog(@"non-user-initiated cancel, you may attempt to retry");
                    break;
                default:
                    break;
            }
            
        }
        else{
            //handle error gracefully
            NSLog(@"error from renew credentials%@",error);
        }
    }];
}

- (IBAction)facebookClicked:(id)sender {
    [self facebook];
}
-(void)keyboardResign{
    [_usernameTextfeild resignFirstResponder];
    [_passwordTExtfeild resignFirstResponder];
}
-(void)facebookRequest{
    
}

- (IBAction)postClicked:(id)sender {
    PostWishViewController *postVC =[self.storyboard instantiateViewControllerWithIdentifier:@"postwishView"];
    [self.navigationController pushViewController:postVC animated:YES];
    
    
}
@end
