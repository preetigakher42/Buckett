//
//  EditProfileViewController.h
//  Buckett
//
//  Created by Anmol Rajdev on 20/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditcontentView.h"
#import "NetworkManager.h"
@interface EditProfileViewController : UIViewController<imageUpload,UIActionSheetDelegate,networkManagerdelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ProfileImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *editScrollView;
@property(strong,nonatomic)NSString *Edituser_id;
@property(weak,nonatomic)NSDictionary *EditDict;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;

- (IBAction)backtoLoginClicked:(id)sender;

@end
