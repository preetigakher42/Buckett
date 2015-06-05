//
//  PostShareImgViewController.h
//  Buckett
//
//  Created by Anmol Rajdev on 02/06/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostShareImgViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *postBgImg;
@property (weak, nonatomic) IBOutlet UILabel *postedLabel_txt;
@property (weak, nonatomic) IBOutlet UICollectionView *postedImgList;
- (IBAction)backClicked:(id)sender;
@property(strong,nonatomic)NSDictionary *receivedData;
@property(strong,nonatomic)NSString *postedText;
@end
