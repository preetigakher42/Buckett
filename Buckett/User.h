//
//  UserView.h
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface User : NSObject
@property(strong,nonatomic) NSString *user_id;
@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSString *password;
@property(strong,nonatomic) NSString *username;
@property(strong,nonatomic) NSString *access_token;
@property(strong,nonatomic) NSString *control_notification_likes;
@property(strong,nonatomic) NSString *control_notification_comments;
@property(strong,nonatomic) NSString *control_notification_follow;
@property(strong,nonatomic) NSString *control_notification_nearby;
@property(strong,nonatomic) NSString *fb_id;
@property(strong,nonatomic) NSString *fb_token;
@property(strong,nonatomic) NSString *android_device_token;
@property(strong,nonatomic) NSString *ios_device_token;
@property(strong,nonatomic) NSString *updated_at;
@property(strong,nonatomic) NSString *created_at;
@property(strong,nonatomic) NSString *deleted_at;
@property(strong,nonatomic) NSString *is_private;
@property(strong,nonatomic) NSString *unread_notifications;
@property(strong,nonatomic) NSString *buckett_admin;
@property(strong,nonatomic) NSString *registration_by;
@property(strong,nonatomic) NSString *register_confirm;
@property(strong,nonatomic) NSString *profile_id;
@property(strong,nonatomic) NSString *usr_id;
@property(strong,nonatomic) NSString *first_name;
@property(strong,nonatomic) NSString *phone;
@property(strong,nonatomic) NSString *user_bio;
@property (nonatomic,strong) UIImage * user_image;
@property(strong,nonatomic) NSString *Userverifie_flag;
@property(strong,nonatomic) NSString *latitude;
@property(strong,nonatomic) NSString *longitude;
@property(strong,nonatomic) NSString *user_location;
@property(strong,nonatomic) NSString *profile_type;
@property(strong,nonatomic) UIImage *cover_image;

-(void)userDetail;




@end
