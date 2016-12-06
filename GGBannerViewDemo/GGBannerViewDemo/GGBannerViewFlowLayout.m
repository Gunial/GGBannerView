//
//  GGBannerViewFlowLayout.m
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "GGBannerViewFlowLayout.h"

@implementation GGBannerViewFlowLayout

- (void)prepareLayout
{
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
}

@end
