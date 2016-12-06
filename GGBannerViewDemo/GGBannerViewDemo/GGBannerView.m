//
//  GGBannerView.m
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "GGBannerView.h"
#import "GGBannerViewFlowLayout.h"
#import "GGBannerViewCell.h"

#import "UIView+GGExtension.h"

#define GGBannerViewCellReuseIdentifier @"GGBannerViewCell"

@interface GGBannerView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, copy) selectedIndexCallBack selectedIndex;
@property (nonatomic, strong) NSArray *imageUrls;
@end

@implementation GGBannerView
{
    NSInteger _currentPage;
    NSTimer *_timer;
}

- (instancetype)initWithImageUrls:(NSArray *)imageUrlArray selectedIndex:(selectedIndexCallBack)selectedIndex
{
    self = [super init];
    if (self) {
        if (imageUrlArray.count) self.imageUrls = imageUrlArray;
        if (selectedIndex) self.selectedIndex =selectedIndex;
        
        [self addSubview:self.collectionView];
        [self addSubview:self.pageControl];
        
        //异步主队列,让数据源的方法限制性完之后,再执行初始化选中操作
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.imageUrls.count > 1) {
                
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.imageUrls.count inSection:0];
                
                // 默认选中中间图片.
                [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
            }
        });
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    self.pageControl.frame = CGRectMake(0, self.gg_height - 20, self.gg_width, 20);
}

/// 准备定时器
- (void)prepareForTimer {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
    _timer = timer;
}

- (void)scrollToNextPage {
    
    NSInteger page = _currentPage;
    
    if (page == 0 || page == [self.collectionView numberOfItemsInSection:0 - 1]) {
        page = self.imageUrls.count - (self.imageUrls.count == 0 ? 0 : 1);
    }else {
        page ++;
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:page inSection:0];
    [self.collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionLeft];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageUrls.count * (self.imageUrls.count ==1 ? 1 : 100000);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GGBannerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GGBannerViewCellReuseIdentifier forIndexPath:indexPath];
    if (self.imageUrls.count) {
        cell.imageUrl = self.imageUrls[indexPath.item % self.imageUrls.count];
    }
        
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectedIndex) {
        self.selectedIndex(indexPath.item % self.imageUrls.count);
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = (NSInteger)((scrollView.contentOffset.x + scrollView.bounds.size.width/2) / scrollView.bounds.size.width) % self.imageUrls.count;
    
    _currentPage = (NSInteger)((scrollView.contentOffset.x + scrollView.bounds.size.width/2) / scrollView.bounds.size.width);
    
    self.pageControl.currentPage = page;
}

/// 滑动停止的时候调用这个方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    //当显示第一张图片的时候,跳转到 _urls.count ,当显示最后一张的时候,跳转到 _urls.count - 1 .
    if (currentIndex == 0 || currentIndex == ([self.collectionView numberOfItemsInSection:0] - 1 )) {
        currentIndex = self.imageUrls.count - (currentIndex == 0 ? 0 : 1);
        scrollView.contentOffset = CGPointMake(currentIndex * scrollView.bounds.size.width, 0);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (self.hasTimer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (self.hasTimer) {
        [self prepareForTimer];
    }
}

#pragma mark - setter

- (void)setHasTimer:(BOOL)hasTimer
{
    if (hasTimer) {
        [self prepareForTimer];
    }
}

#pragma mark - lazy
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[GGBannerViewFlowLayout alloc] init]];
        _collectionView.backgroundColor = [UIColor redColor];
        [_collectionView registerClass:[GGBannerViewCell class] forCellWithReuseIdentifier:GGBannerViewCellReuseIdentifier];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = self.imageUrls.count;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    }
    return _pageControl;
}

@end
