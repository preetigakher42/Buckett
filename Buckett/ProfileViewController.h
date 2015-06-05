//
//  ProfileViewController.h
//  Buckett
//
//  Created by Anmol Rajdev on 25/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UILabel *profileCountry_lbl;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageview;
@property (weak, nonatomic) IBOutlet UILabel *profileName_lbl;
@property (weak, nonatomic) IBOutlet UIButton *editProfileClicked;
@property (weak, nonatomic) IBOutlet UIButton *myPostsBtn;
- (IBAction)myPostsClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label_Posts;
@property (weak, nonatomic) IBOutlet UIButton *wishlistBtn;
@property (weak, nonatomic) IBOutlet UIButton *wishlistClicked;
- (IBAction)pickedClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *wishes_Lbl;
@property (weak, nonatomic) IBOutlet UILabel *followers_lbl;
@property (weak, nonatomic) IBOutlet UILabel *following_lbl;
@property (weak, nonatomic) IBOutlet UICollectionView *PostListView;



@end
