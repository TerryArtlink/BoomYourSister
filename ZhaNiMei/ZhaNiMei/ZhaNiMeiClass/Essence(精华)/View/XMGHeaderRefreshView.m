//
//  XMGHeaderRefreshView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGHeaderRefreshView.h"

@interface XMGHeaderRefreshView ()
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (weak, nonatomic) IBOutlet UILabel *dragView;
@property (weak, nonatomic) IBOutlet UIView *isLoadingView;

@end

@implementation XMGHeaderRefreshView

+(instancetype)viewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setIsAllAppear:(BOOL)isAllAppear {
    _isAllAppear = isAllAppear;
    
    [UIView animateWithDuration:0.25 animations:^{
        _arrow.transform = isAllAppear ? CGAffineTransformMakeRotation(-M_PI+0.00001) : CGAffineTransformIdentity;
    }];
    
    _dragView.text = isAllAppear ? @"松开立即刷新" : @"下拉可以刷新";
}

//监听是否正在加载
-(void)setIsLoading:(BOOL)isLoading {
    _isLoading = isLoading;
    _isLoadingView.hidden = !isLoading;
    _dragView.hidden = isLoading;
    _arrow.hidden = isLoading;
}

@end























