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

     NSArray *urlStringArray = @[@"http://img.xiazaizhijia.com/uploads/2016/1028/20161028091335212.jpg", @"http://image.it168.com/n/640x480/8/8134/8134259.jpg"];
    
    GGBannerView *bannerView = [[GGBannerView alloc] initWithImageUrls:urlStringArray selectedIndex:^(NSInteger index) {
        NSLog(@"选中的索引:%zd",index);
    }];
    bannerView.hasTimer = YES;
    bannerView.placeType = GGPageControlPlaceRight;
    bannerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    [self.view addSubview:bannerView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
