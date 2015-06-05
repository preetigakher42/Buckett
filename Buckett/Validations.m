//
//  Validations.m
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "Validations.h"

@implementation Validations

#pragma mark email format check method

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
-(BOOL)NSStringIsValidPassword:(NSString *)checkString{
    BOOL status =YES;
    NSLog(@"%@",checkString);
        if (checkString.length <6 ) {
            status =  NO;
        
    }
    
    return status;
}
- (BOOL)validate:(NSString *)string
{
    NSError *error             = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"[a-zA-Z ]" options:0 error:&error];
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    return numberOfMatches == string.length;
}
#define ACCEPTABLE_CHARACTERS @" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_."
-(BOOL)validateUsername:(NSString *)string{
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARACTERS] invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    return [string isEqualToString:filtered];
}
//- (BOOL)string:(NSString *)text matches:(NSString *)pattern
//{
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
//    
//    NSArray *matches = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
//    
//    
//    
////    NSString *password = @"iS_bhd97zAA!";
////    NSString *scPattern = @"[a-z]";
////    NSString *cPattern = @"[A-Z]";
////    NSString *sPattern = @"[!%&\._;,]";
////    NSString *nPattern = @"[0-9]";
////    
////    if (8 <= password.length && password.length <= 15 &&
////        [self string:password matches:scPattern] &&
////        [self string:password matches:cPattern] &&
////        [self string:password matches:sPattern] &&
////        [self string:password matches:nPattern])
////    {
////        NSLog(@"PW is valid");
////    }
//    return matches.count > 0;
//    
//    
//    
//}
@end
