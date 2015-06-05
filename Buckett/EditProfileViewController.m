//
//  EditProfileViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 20/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "EditProfileViewController.h"
#import "EditcontentView.h"
#import "ProfileViewController.h"
#import "User.h"
#import "NetworkManager.h"
#import "MBProgressHUD.h"
@interface EditProfileViewController ()

@end

@implementation EditProfileViewController
{
    EditcontentView *editVc;
    NetworkManager *manager;
    User *user;
    double tagValue;
    NSString *userId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView * baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 672)];
    
    manager=[[NetworkManager alloc]init];
    manager.delegate=self;
    user=[[User alloc]init];
    
    editVc =[[EditcontentView alloc]init];
    editVc.delegate=self;
   
    editVc.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 672);
    [baseView addSubview:editVc.view];
    [_editScrollView addSubview:baseView];
    [_editScrollView setContentSize:(CGSizeMake(self.view.frame.size.width,672))];
     //*************getting Userdata***************//
    
    userId=[manager getInfo];
    NSLog(@"%@",userId);
    NSLog(@"editdict%@",_Edituser_id);
    
    
    NSMutableDictionary *mutableRetrievedDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:@"user"] mutableCopy];
    NSLog(@"%@",mutableRetrievedDictionary);

    NSMutableArray *datadict=[mutableRetrievedDictionary objectForKey:@"data"];
    editVc.emailTextfeild.text=[[datadict valueForKey:@"user_data"]valueForKey:@"email"];
    editVc.usernameTextfeild.text=[[datadict valueForKey:@"user_data"] valueForKey:@"username"];
    editVc.passwordtextfeild.text=editVc.passwordtextfeild.text;
    editVc.confirmPasswordTextField.text=editVc.confirmPasswordTextField.text;
    
    editVc.locationTextfeild.text=[[datadict valueForKey:@"user_data"] valueForKey:@"user_location"];
    editVc.bioTextview.text=[[datadict valueForKey:@"user_data"] valueForKey:@"user_bio"];
    editVc.phoneTextfeild.text=[[datadict valueForKey:@"user_data"] valueForKey:@"phone"];
    
    
    
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


- (IBAction)backtoLoginClicked:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)imageUploadClicked:(UIButton *)sender{
    NSLog(@"%ld",(long)sender.tag);
    tagValue=sender.tag;
    NSString *other1 = @"Take a Picture";
    
    NSString *other2 = @"Choose from Gallery";
    //    NSString *other3 = @"Other Button 3";
    //    NSString *cancelTitle = @"Cancel Button";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:other1,other2, nil];
    [actionSheet showInView:self.view];

    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:nil];
        }
            break;
        case 1:
        {
            // take a picture from gallery photos
                        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
                        picker.delegate = self;
                        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//                        [self.view addSubview:toolbar];
                        [self presentViewController:picker animated:YES completion:nil];
        }
            break;
        default:
            break;   
    }
    
}


#pragma mark UIImagePickerControllerDelegate

- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo
{
    user.email =@"";
    user.username=@"";
    user.user_location=@"";
    user.user_bio=@"";
    user.phone=@"";
    
    if (tagValue==20) {
          editVc.profileImageView.image = image;
      
            [manager UpdateProfileViaUser:user :editVc.profileImageView.image :nil];
            }
    else  {
                editVc.bgImgView.image=image;
        [manager UpdateProfileViaUser:user :nil :editVc.bgImgView.image];

    }
    [self dismissModalViewControllerAnimated:YES];

}


# pragma mark Network manager Delegates
//-(void)UpdateProfileViaUser:(User *)user :(UIImage *)userimage :(UIImage *)coverimage{
//    
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    
//    // Configure for text only and offset down
//    hud.mode = MBProgressHUDModeText;
//    hud.labelText = @"Updated successfully.";
//    hud.margin = 7.f;
//    hud.yOffset = 120.f;
//    hud.labelFont =[UIFont systemFontOfSize:13];
//
//    hud.removeFromSuperViewOnHide = YES;
//    
//    [hud hide:YES afterDelay:2];
//    }

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
    
}
#pragma mark textField Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark touch event method

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [editVc.usernameTextfeild resignFirstResponder];
    
    [editVc.passwordtextfeild resignFirstResponder];
    
    [editVc.emailTextfeild resignFirstResponder];
    [editVc.locationTextfeild resignFirstResponder];
    [editVc.bioTextview resignFirstResponder];
    [editVc.phoneTextfeild resignFirstResponder];
}

#pragma mark Keyboard code



- (void)keyboardWillShow:(NSNotification *)notification

{
    // Get the size of the keyboard.
    NSDictionary* info = [notification userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    // Save the current location so we can restore
    // when keyboard is dismissed
//    offset = _editScrollView.contentOffset;
    
    // Resize the scroll view to make room for the keyboard
    CGRect viewFrame = _editScrollView.frame;
    viewFrame.size.height -= keyboardSize.height+10;
    _editScrollView.frame = viewFrame;
    
    // Keyboard is now visible
    
}



-(void)keyboardWillHide:(NSNotification *)notification

{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect f =_editScrollView.frame;
        
        f.origin.y = 64.0f;
       _editScrollView.frame=f;
    }];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.navigationController.navigationBarHidden=YES;
}
//implementation
-(void)Editsucess:(NSDictionary *)response{
    
    NSLog(@"Edit Profile---%@",response);
  NSMutableArray *myArray=[response objectForKey:@"user"];
    NSLog(@"Edit Profile---%@",myArray);
    
    NSLog(@"Updated Successfully");
//    editVc.emailTextfeild.text=[myArray valueForKey:@"email"];
//    editVc.usernameTextfeild.text=[myArray valueForKey:@"username"];
//    editVc.passwordtextfeild.text=[myArray valueForKey:@"password"];
//    editVc.locationTextfeild.text=[myArray valueForKey:@"location"];
//    editVc.bioTextview.text=[myArray valueForKey:@"user_bio"];
//    editVc.phoneTextfeild.text=[myArray valueForKey:@"phone"];
//    editVc.passwordtextfeild.text=[myArray valueForKey:@"new_password"];
//   NSString *imgUrlString=[myArray valueForKey:@"user_image"];
//    NSLog(@"%@",imgUrlString);
//    
//    NSURL *url = [NSURL URLWithString:imgUrlString];
//    
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSData *imageData = [NSData dataWithContentsOfURL:url];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // Update the UI
//           
//            editVc.profileImageView.image = [UIImage imageWithData:imageData];
//            editVc.profileImageView.image=[myArray  valueForKey:@"user_image"];
//            
//            
//           
//            
//            
//            
//        });
//    });

    
}


@end
