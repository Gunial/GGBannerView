//
//  GGBannerView.h
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectedIndexCallBack)();

@interface GGBannerView : UIView

- (instancetype)initWithImageUrlArray:(NSArray *)imageUrls
                        SelectedIndex:(selectedIndexCallBack)selectedIndex;

@end
