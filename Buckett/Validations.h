//
//  Validations.h
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validations : NSObject
-(BOOL) NSStringIsValidEmail:(NSString *)checkString;
-(BOOL) NSStringIsValidPassword:(NSString *)checkString;
-(BOOL)validateUsername:(NSString *)string;
@end
