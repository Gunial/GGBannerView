//
//  ViewController.m
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "ViewController.h"
#import "GGBannerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     NSArray *urlStringArray = @[@"http://pic50.nipic.com/file/20141010/9885883_092142007001_2.jpg", @"http://image.it168.com/n/640x480/8/8134/8134259.jpg"];
    
    GGBannerView *bannerView = [[GGBannerView alloc] initWithImageUrlArray:urlStringArray SelectedIndex:nil];
    bannerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    
    [self.view addSubview:bannerView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
