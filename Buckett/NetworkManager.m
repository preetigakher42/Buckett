//
//  NetworkManager.m
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking.h>
#import "MBProgressHUD.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@implementation NetworkManager{
    NSMutableDictionary *mutableRetrievedDictionary;
}


-(void)RegisterUserViaLogin:(User *)user{
    
    
    NSLog(@"%@",user.username);
    NSLog(@"%@",user.password);
    NSLog(@"%@",user.email);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"email":user.email,
                                 @"password":user.password,
                                 @"username":user.username};
    [manager setResponseSerializer:[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments]];
    [manager POST:@"http://42devlabs.com/buckett.co/buckett.it/index.php/buckett_api/user_register" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"JSON: %@", responseObject);
//        NSMutableArray *user_Id=[responseObject objectForKey:@"user"];
        [self saveInfo:responseObject];
        [self.delegate Registersuccess:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        
        [self.delegate errorResponse];
    }];
    
    
    
    
    
    
}
-(void)LoginViaUser:(User *)user{
    
   

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"email":user.email,
                                 @"password":user.password};
    [manager POST:@"http://42devlabs.com/buckett.co/buckett.it/index.php/buckett_api/user_login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    
        [self.delegate loginsuccess:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.delegate errorResponse];
    }];
    
    
}
-(void)ForgotPasswordViaUser:(User *)user{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"email":user.email};
    [manager POST:@"http://42devlabs.com/buckett.co/buckett.it/index.php/buckett_api/forgot_password" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        [self.delegate Forgotsuccess:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.delegate errorResponse];
    }];
    
     
}
-(void)UpdateProfileViaUser:(User *)user :(UIImage *)userimage :(UIImage *)coverimage{
    NSLog(@"%@",user.email);
    NSLog(@"%@",user.username);
    NSLog(@"%@",user.user_location);
    NSLog(@"%@",user.user_bio);
    NSLog(@"%@",user.phone);
    NSLog(@"%@",user.user_image);
    NSLog(@"%@",user.password);
//    [self getInfo];
    
    mutableRetrievedDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:@"user"] mutableCopy];
    NSLog(@"%@",mutableRetrievedDictionary);

    NSString *getAcessToken=[[mutableRetrievedDictionary objectForKey:@"user_data"]valueForKey:@"access_token"];
    NSLog(@"%@",getAcessToken);
 NSLog(@"%@",user.password);
//    NSString *acesstoken =@"$2y$10$5drtKf75klh2PU6G7GLf4.trEG9jN5ru0RYOBClAZN28FeYYnQDZ6";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"email": user.email,
                                 @"latitide":@"30.23",
                                 @"longitude":@"27.80",
                                 @"username":user.username,
                                 @"location":user.user_location,
                                 @"bio":user.user_bio,
                                 @"phone":user.phone,
                                 @"access_token":getAcessToken};
    
     NSData * imageData = UIImagePNGRepresentation(userimage);
     NSData * coverimageData = UIImagePNGRepresentation(coverimage);
    [manager POST:@"http://42devlabs.com/buckett.co/buckett.it/index.php/buckett_api/update_profile" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSLog(@"%@",userimage);
        if (userimage) {
           
            
            [formData appendPartWithFileData:imageData name:@"user_image" fileName:@"profile.png" mimeType:@"image/png"];
            
        }
        
        if (coverimage) {
            
           
            [formData appendPartWithFileData:coverimageData name:@"cover_image" fileName:@"profile2.png" mimeType:@"image/png"];
            
        }
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
         [self.delegate Editsucess:responseObject];
        NSLog(@"m here");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSString *str=[NSString stringWithFormat:@"%@",error];
        NSLog(@"%@",str);
         [self.delegate errorResponse];
    }];
    
}

-(void)saveInfo:(NSDictionary *)Info {
    NSLog(@"%@",Info);
    
    
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *myDictionary = [[NSMutableDictionary  alloc] init];
   
    [[NSUserDefaults standardUserDefaults] setObject:Info forKey:@"user"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"Data saved%@",myDictionary);
    [defaults synchronize];
   
    
}
-(NSDictionary *)getInfo{
    
    mutableRetrievedDictionary = [[[NSUserDefaults standardUserDefaults] objectForKey:@"user"] mutableCopy];
    NSLog(@"%@",mutableRetrievedDictionary);
    NSString *getAcessToken=[[mutableRetrievedDictionary objectForKey:@"user"]valueForKey:@"access_token"];
    NSLog(@"%@",getAcessToken);
    
    
    return mutableRetrievedDictionary;
}
-(void)bingImageSearch:(NSString *)textviewStr{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer clearAuthorizationHeader];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"SyqOSr8f5bhVf973O5CyKbJpy28hZwJZwezDCTnpa6c" password:@"SyqOSr8f5bhVf973O5CyKbJpy28hZwJZwezDCTnpa6c"];
    NSString *queryString=[textviewStr stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSString * const BING_URL = @"https://api.datamarket.azure.com/Data.ashx/Bing/Search/v1/Image?";
    NSString * const append = @"=%27Style%3aPhoto%2bSize%3aLarge%2bAspect%3aSquare%27&$format=json";
    NSString *urlString = [NSString stringWithFormat:@"%@Query='%@'&ImageFilters%@",BING_URL, queryString,append];
    NSLog(@"urlstring=%@",urlString);
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self.delegate BingImagesSucess:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.delegate errorResponse];
    }];

    
    
}

-(void)faceBookviaUser:(NSString *)email :(NSString *)fb_id{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSLog(@"email%@",email);
    NSLog(@"fb_id%@",fb_id);
    NSLog(@"%@",[FBSDKAccessToken currentAccessToken].tokenString);
    NSDictionary *parameters = @{@"email":email,
                                 @"fb_id":fb_id,
                                 @"fb_token":[FBSDKAccessToken currentAccessToken].tokenString};
    [manager POST:@"http://42devlabs.com/buckett.co/buckett.it/index.php/buckett_api/facebook_login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self.delegate loginsuccess:responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.delegate errorResponse];
    }];
}
@end
