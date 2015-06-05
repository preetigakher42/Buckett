//
//  PostWishViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 02/06/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "PostWishViewController.h"
#import "NetworkManager.h"
#import "PostShareImgViewController.h"
@interface PostWishViewController ()

@end

@implementation PostWishViewController
{
    NetworkManager *networkManager;
    NSDictionary *resposeArray;
    NSMutableArray *mediaUrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    networkManager=[[NetworkManager alloc]init];
    networkManager.delegate=self;
   
    
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
- (void) textViewDidBeginEditing:(UITextView *) textView {
    [textView setText:@""];
}
- (IBAction)backClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextClicked:(id)sender {
    
}

#pragma mark textField Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark touch event method

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
       [_PostTextView resignFirstResponder];
    
    
    
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    NSLog(@"%@",textView);
    [_activityIndicator startAnimating];
    [networkManager bingImageSearch:textView.text];
   
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
# pragma mark Network manager Delegates
-(void)BingImagesSucess:(NSDictionary *)response{
    NSLog(@"response in Post View %@",response);
    [_activityIndicator stopAnimating];
    resposeArray=response;
    if (![resposeArray isEqualToDictionary:nil]) {
        PostShareImgViewController *postVC=[self.storyboard instantiateViewControllerWithIdentifier:@"postshareView"];
        postVC.receivedData=resposeArray;
        postVC.postedText=_PostTextView.text;
        [self.navigationController pushViewController:postVC animated:YES];
    }

    //    NSMutableDictionary *mutableRetrievedDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:@"user"] mutableCopy];
    //    NSLog(@"%@",mutableRetrievedDictionary);
    //    NSString *getAcessToken=[[mutableRetrievedDictionary objectForKey:@"user"]valueForKey:@"access_token"];
    //    NSLog(@"%@",getAcessToken);
    
    
//    NSNumber * isSuccessNumber = (NSNumber *)[response objectForKey: @"status"];
//    NSString *alertmsg=[response valueForKey:@"msg"];
//    if([isSuccessNumber boolValue] == YES)
//    {
//        // this is the YES case
//        
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//        
//        // Configure for text only and offset down
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = alertmsg;
//        hud.labelFont =[UIFont systemFontOfSize:14];
//        hud.margin = 10.f;
//        hud.yOffset = 100.f;
//        hud.removeFromSuperViewOnHide = YES;
//        
//        [hud hide:YES afterDelay:2];
//        [networkmanager saveInfo:response];
//        NSString *getUser_Id=[[response objectForKey:@"user_data"]valueForKey:@"user_id"];
//        NSLog(@"%@",getUser_Id);
//        
//        EditProfileViewController *hvc =[self.storyboard instantiateViewControllerWithIdentifier:@"editView"];
//        hvc.Edituser_id= getUser_Id;
//        [self.navigationController pushViewController:hvc animated:YES];
//        
//    } else {
//        NSLog(@"error");
//        NSString *alertmsgerror=[response valueForKey:@"error"];
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//        
//        // Configure for text only and offset down
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = alertmsgerror;
//        hud.labelFont =[UIFont systemFontOfSize:13];
//        hud.margin = 10.f;
//        hud.yOffset = -70.f;
//        hud.removeFromSuperViewOnHide = YES;
//        
//        [hud hide:YES afterDelay:2];
//        
//    }
//    
    
    
}
-(void)errorResponse{
    NSLog(@"error received");
}

@end
