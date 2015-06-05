//
//  ProfileViewController.m
//  Buckett
//
//  Created by Anmol Rajdev on 25/05/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *prflImg_heightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *prflImg_widthConstraint;

@end

@implementation ProfileViewController{
    NSMutableArray *imgArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makingRoundCorners:_editProfileClicked.layer :15];
    
    imgArray =[[NSMutableArray alloc]initWithObjects:@"hotel10.jpeg",@"hotel11.jpeg",@"hotel6.jpeg",@"hotel7.jpeg", nil];
    _prflImg_heightConstraint.constant = self.view.frame.size.width*.28 ;   _prflImg_widthConstraint.constant = self.view.frame.size.width*.28;
    [_profileImageview setNeedsUpdateConstraints];
    
    [UIView animateWithDuration:0 animations:^{
        [_profileImageview layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.profileImageview.layer.cornerRadius = self.profileImageview.frame.size.width / 2;
        self.profileImageview.clipsToBounds = YES;
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark rounding layer

-(void)makingRoundCorners:(CALayer *)layer :(CGFloat)radius
{
    layer.borderColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:.3].CGColor;
    layer.borderWidth = 1.0f;
    layer.cornerRadius = radius;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return [imgArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCell" forIndexPath:indexPath];
    
     return cell;
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    CGSize retval =  CGSizeMake(self.view.frame.size.width/2, (self.view.frame.size.width/2)*1.3);
   
    return retval;
}
- (IBAction)myPostsClicked:(id)sender {
}
- (IBAction)pickedClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
   }



- (IBAction)wishlistClicked:(id)sender {
}
@end
