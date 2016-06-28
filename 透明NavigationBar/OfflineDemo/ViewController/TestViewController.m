//
//  TestViewController.m
//  OfflineDemo
//
//  Created by LIXIAOJING on 3/4/16.
//  Copyright © 2016 dog-47.com. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *img=[[UIImageView alloc]initWithFrame:self.view.bounds];
    img.image=[UIImage imageNamed:@"lesson_card_background"];
    [img setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:img];
}


@end
