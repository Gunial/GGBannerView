//
//  GGBannerView.m
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "GGBannerView.h"
#import "UIView+GGExtension.h"
#import "GGBannerViewFlowLayout.h"

@interface GGBannerView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, copy) selectedIndexCallBack selectedIndex;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageUrlsArray;

@end

@implementation GGBannerView

- (instancetype)initWithImageUrlArray:(NSArray *)imageUrls SelectedIndex:(selectedIndexCallBack)selectedIndex
{
    self = [super init];
    if (self) {
        if (selectedIndex) self.selectedIndex = selectedIndex;
        if (imageUrls.count > 0) self.imageUrlsArray = imageUrls;
        [self gg_configSubViews];
    }
    return self;
}

- (void)gg_configSubViews
{
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _collectionView.frame = self.frame;
    _pageControl.frame = CGRectMake(0, self.gg_height - 20, self.gg_width, 20);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageUrlsArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1.0];
    
    return cell;
}

#pragma mark - lazy
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[GGBannerViewFlowLayout alloc] init]];
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = self.imageUrlsArray.count;
    }
    return _pageControl;
}

@end
