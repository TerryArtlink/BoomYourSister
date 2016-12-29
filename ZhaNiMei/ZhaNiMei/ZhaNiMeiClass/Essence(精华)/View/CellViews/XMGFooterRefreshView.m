//
//  XMGFooterRefreshView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGFooterRefreshView.h"

@interface XMGFooterRefreshView ()
@property (weak, nonatomic) IBOutlet UILabel *pullLabel;
@property (weak, nonatomic) IBOutlet UIView *lodingView;

@end

@implementation XMGFooterRefreshView

+(instancetype)viewFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
}

-(void)setIsLoading:(BOOL)isLoading {
    _isLoading = isLoading;
    _lodingView.hidden = !isLoading;
    _pullLabel.hidden = isLoading;
}









@end
