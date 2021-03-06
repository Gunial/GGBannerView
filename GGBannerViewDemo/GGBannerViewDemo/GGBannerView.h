//
//  GGBannerView.h
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    GGPageControlPlaceLeft,
    GGPageControlPlaceCenter,
    GGPageControlPlaceRight
}GGPageControlPlaceType;

typedef void(^selectedIndexCallBack)(NSInteger index);

@interface GGBannerView : UIView

@property (nonatomic, assign) GGPageControlPlaceType placeType;

- (instancetype)initWithImageUrls:(NSArray *)imageUrlArray selectedIndex:(selectedIndexCallBack)selectedIndex;

@end
