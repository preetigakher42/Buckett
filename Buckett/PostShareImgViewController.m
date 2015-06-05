//
//  PostShareImgViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 02/06/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "PostShareImgViewController.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "PostCollectionViewCell.h"
#import "DraggableView.h"
@interface PostShareImgViewController ()

@end
 static NSString * const reuseIdentifier = @"cell";
@implementation PostShareImgViewController
{
    NSMutableArray *mediaUrl;
    DraggableView *dvc;
    CGPoint _previousLocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"received Dict data---%@",_receivedData);
    mediaUrl=[[NSMutableArray alloc]init];
   
    
    NSDictionary *dictD=[_receivedData objectForKey:@"d"];
    NSMutableArray *result=[dictD objectForKey:@"results"];
    mediaUrl=[result valueForKey:@"MediaUrl"];
    NSLog(@"%@",mediaUrl);
    [self.postedImgList registerClass:[PostCollectionViewCell class] forCellWithReuseIdentifier:@"Postcell"];
    [self.postedImgList registerNib:[UINib nibWithNibName:@"PostCollectionViewCell" bundle:[NSBundle mainBundle]]
            forCellWithReuseIdentifier:@"Postcell"];
    dvc =[[DraggableView alloc]init];
    dvc.tag=500;
    CGRect dvcframe =CGRectMake(0, 100, 158, 100);
    dvc.view.frame=dvcframe;
    [dvc.view setUserInteractionEnabled:YES];
   
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handlePan:)];
    [dvc.view addGestureRecognizer:panRecognizer];
    
    
    
    [self.view addSubview:dvc.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self.view]; // <--- note self.superview
//  
//    UIView* viewYouWishToObtain = [self.view hitTest:location withEvent:event];
//    NSLog(@"%ld",(long)viewYouWishToObtain.tag);
//    
//    if ( CGRectContainsPoint(dvc.view.bounds, location) ) {
//        // Point lies inside the bounds.
//        NSLog(@"m in imageview");
//        
//        if ( CGRectContainsPoint(_postBgImg.bounds, location) ) {
//            [UIView beginAnimations:@"Dragging A DraggableView" context:nil];
//            dvc.layer.position =location;
//            [UIView commitAnimations];
//        }
//        
//        
//
//        
   // }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view bringSubviewToFront:dvc.view];
    _previousLocation=dvc.view.center;
}

- (void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint translation = [panGestureRecognizer translationInView:self.postBgImg];
    
    if ((_previousLocation.x + translation.x-(dvc.view.frame.size.width/2))>=0 && (_previousLocation.x + translation.x+(dvc.view.frame.size.width/2))<=self.view.frame.size.width &&  (_previousLocation.y + translation.y-dvc.view.frame.size.height/2)>=64 && (_previousLocation.y + translation.y+dvc.view.frame.size.height/2)<=_postBgImg.frame.origin.y+_postBgImg.frame.size.height) {
        dvc.view.center = CGPointMake(_previousLocation.x + translation.x,
                                      _previousLocation.y + translation.y);
    }
    
    
    
    
}

//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    CGPoint location = [[touches anyObject] locationInView:self.view];
//    CGRect fingerRect = CGRectMake(location.x-5, location.y-5, 10, 10);
//    
//    for(UIView *view in self.view.subviews){
//        CGRect subviewFrame = view.frame;
//        
//        if(CGRectIntersectsRect(fingerRect, subviewFrame)){
//            //we found the finally touched view
//            NSLog(@"Yeah !, i found it %@",view);
//        }
//        
//    }
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return [mediaUrl count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
     PostCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Postcell" forIndexPath:indexPath];

    NSString * url = [NSString stringWithFormat:@"%@",[mediaUrl objectAtIndex:indexPath.row]];
//     UIImageView *imgView=(UIImageView * )[cell viewWithTag:100];
//     [cell.imageView setImageWithURL:[NSURL URLWithString:url]];
    [cell.imageView setImageWithURL:[NSURL URLWithString:url]
                   placeholderImage:[UIImage imageNamed:@"square.png"]];

    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostCollectionViewCell *cell=(PostCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    _postBgImg.image= cell.imageView.image;
}

-(void)viewWillAppear:(BOOL)animated{
    NSString * url = [NSString stringWithFormat:@"%@",[mediaUrl objectAtIndex:0]];
    //     UIImageView *imgView=(UIImageView * )[cell viewWithTag:100];
    //     [cell.imageView setImageWithURL:[NSURL URLWithString:url]];
    [_postBgImg setImageWithURL:[NSURL URLWithString:url]
                   placeholderImage:[UIImage imageNamed:@"square.png"]];

    _postedLabel_txt.text=_postedText;

    
}
@end
