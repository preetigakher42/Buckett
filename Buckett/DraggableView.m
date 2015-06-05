//
//  DraggableView.m
//  Buckett
//
//  Created by Anmol Rajdev on 04/06/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "DraggableView.h"

@implementation DraggableView

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
        
        self.view = [[[NSBundle mainBundle] loadNibNamed:@"DraggableView" owner:self options:nil] firstObject];
        [self addSubview:self.view];
        self.userInteractionEnabled = YES;
       
    }
   
        return self;
}

//- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self.superview]; // <--- note self.superview
//    
//    self.center = location;
//}

@end
