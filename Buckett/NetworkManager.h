//
//  NetworkManager.h
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import <UIKit/UIKit.h>
@protocol networkManagerdelegate <NSObject>

-(void)loginsuccess:(NSDictionary *)response;
-(void)errorResponse;

-(void)Registersuccess:(NSDictionary *)Regresponse;
-(void)Forgotsuccess:(NSDictionary *)response;
-(void)Editsucess:(NSDictionary *)response;
-(void)BingImagesSucess:(NSDictionary *)response;
-(void)facebookRequest:(NSDictionary *)response;


@end
@interface NetworkManager : NSObject{
    id<networkManagerdelegate> delegate;
    
}
@property(retain)id<networkManagerdelegate> delegate;
-(void)RegisterUserViaLogin:(User *)user;
-(void)LoginViaUser:(User *)user;
-(void)bingImageSearch:(NSString *)textviewStr;
-(void)ForgotPasswordViaUser:(User *)user;
-(void)UpdateProfileViaUser:(User *)user :(UIImage *)userimage :(UIImage *)coverimage;
-(void)saveInfo:(NSDictionary *)Info;
-(void)faceBookviaUser:(NSString *)email :(NSString *)fb_id;
-(NSString *)getInfo;

@end
