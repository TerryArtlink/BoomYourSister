//
//  UIView+frame.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/10.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)
//x
- (void)setXmg_x:(CGFloat)xmg_x {
    CGRect frame = self.frame;
    
    frame.origin.x = xmg_x;
    
    self.frame = frame;
}

- (CGFloat)xmg_x {
    return self.frame.origin.x;
}
//y
- (void)setXmg_y:(CGFloat)xmg_y {
    CGRect frame = self.frame;
    
    frame.origin.y = xmg_y;
    
    self.frame = frame;
}

- (CGFloat)xmg_y {
    return self.frame.origin.y;
}

//w
- (void)setXmg_w:(CGFloat)xmg_w {
    CGRect frame = self.frame;
    
    frame.size.width = xmg_w;
    
    self.frame = frame;
}

- (CGFloat)xmg_w {
    return self.frame.size.width;
}
//y
- (void)setXmg_h:(CGFloat)xmg_h {
    CGRect frame = self.frame;
    
    frame.size.height = xmg_h;
    
    self.frame = frame;
}

- (CGFloat)xmg_h {
    return self.frame.size.height;
}

//补充
-(CGFloat)xmg_centerX {
    return self.center.x;
}

-(void)setXmg_centerX:(CGFloat)xmg_centerX {
    CGPoint center = self.center;
    center.x = xmg_centerX;
    self.center = center;
}

-(CGFloat)xmg_centerY {
    return self.center.y;
}

-(void)setXmg_centerY:(CGFloat)xmg_centerY {
    CGPoint center = self.center;
    center.y = xmg_centerY;
    self.center = center;
}

@end
