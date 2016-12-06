//
//  UIView+GGExtension.m
//  Extension
//
//  Created by Mr.Gu on 16/11/2.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "UIView+GGExtension.h"

@implementation UIView (GGExtension)

- (void)setGg_x:(CGFloat)gg_x
{
    CGRect frame = self.frame;
    frame.origin.x = gg_x;
    self.frame = frame;
}

- (CGFloat)gg_x
{
    return self.gg_origin.x;
}

- (void)setGg_y:(CGFloat)gg_y
{
    CGRect frame = self.frame;
    frame.origin.y = gg_y;
    self.frame = frame;
}

- (CGFloat)gg_y
{
    return self.gg_origin.y;
}

- (void)setGg_centerX:(CGFloat)gg_centerX
{
    CGPoint center = self.center;
    center.x = gg_centerX;
    self.center = center;
}

- (CGFloat)gg_centerX
{
    return self.center.x;
}

- (void)setGg_centerY:(CGFloat)gg_centerY
{
    CGPoint center = self.center;
    center.y = gg_centerY;
    self.center = center;
}

- (CGFloat)gg_centerY
{
    return self.center.y;
}

- (void)setGg_width:(CGFloat)gg_width
{
    CGRect frame = self.frame;
    frame.size.width = gg_width;
    self.frame = frame;
}

- (CGFloat)gg_width
{
    return self.gg_size.width;
}

- (void)setGg_height:(CGFloat)gg_height
{
    CGRect frame = self.frame;
    frame.size.height = gg_height;
    self.frame = frame;
}

- (CGFloat)gg_height
{
    return self.gg_size.height;
}

- (void)setGg_origin:(CGPoint)gg_origin
{
    CGRect frame = self.frame;
    frame.origin = gg_origin;
    self.frame = frame;
}

- (CGPoint)gg_origin
{
    return self.frame.origin;
}

- (void)setGg_size:(CGSize)gg_size
{
    CGRect frame = self.frame;
    frame.size = gg_size;
    self.frame = frame;
}

- (CGSize)gg_size
{
    return self.frame.size;
}

@end
