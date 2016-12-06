//
//  GGBannerView.h
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectedIndexCallBack)(NSInteger index);

@interface GGBannerView : UIView

/// 是否开启定时器
@property (nonatomic, assign) BOOL hasTimer;

- (instancetype)initWithImageUrls:(NSArray *)imageUrlArray selectedIndex:(selectedIndexCallBack)selectedIndex;

@end
