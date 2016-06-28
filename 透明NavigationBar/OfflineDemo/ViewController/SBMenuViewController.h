//
//  SBMenuViewController.h
//  ABC360
//
//  Created by dog_47 on 1/15/16.
//  Copyright © 2016 abc360.com. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "CircleButton.h"

@interface SBMenuViewController : UIViewController


@property (strong,nonatomic) NSString *imgStr;
@property (strong,nonatomic) NSString *title1;
@property (strong,nonatomic) NSString *title2;
@property (assign,nonatomic) NSInteger lessonIndex;
@property (strong,nonatomic) NSNumber *lessonId;

@property (strong,nonatomic) UIImageView *menuImg;
@property (strong,nonatomic) CircleButton *imgSuperView;

@end
