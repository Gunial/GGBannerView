//
//  GGBannerViewCell.m
//  GGBannerViewDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "GGBannerViewCell.h"
#import "YYWebImage.h"

@implementation GGBannerViewCell
{
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    
    [_imageView yy_setImageWithURL:[NSURL URLWithString:imageUrl] placeholder:[UIImage imageNamed:@"car"]];
}

@end
