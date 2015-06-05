//
//  PostView.m
//  Buckett
//
//  Created by Anmol Rajdev on 26/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "PostView.h"

@implementation PostView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    self =[super init];
    if (self) {
        
        self.View = [[[NSBundle mainBundle] loadNibNamed:@"PostView" owner:self options:nil] firstObject];
        [self addSubview:self.View];
      
    }
    
    
    
    return self;
}

- (IBAction)facebookClicked:(id)sender {
}
- (IBAction)instagram_Clicked:(id)sender {
}

- (IBAction)postClicked:(id)sender {
}
@end
