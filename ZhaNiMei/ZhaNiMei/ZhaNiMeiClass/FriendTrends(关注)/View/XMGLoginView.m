//
//  XMGLoginView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGLoginView.h"

@interface XMGLoginView ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation XMGLoginView

+(instancetype)loginView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

+(instancetype)registerView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

//控件不一定能够拿到
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

//从xib中加载出来就会执行,来到这个方法,所有的控件都已经准备好
-(void)awakeFromNib {
    [super awakeFromNib];
    
    UIImage *image = [self.loginBtn backgroundImageForState:UIControlStateNormal];
    //拉伸了图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    
    //重新给button设置回去
    
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    UIImage *imageH = [self.loginBtn backgroundImageForState:UIControlStateHighlighted];
    
    //拉伸了图片
    imageH = [imageH stretchableImageWithLeftCapWidth:imageH.size.width*0.5 topCapHeight:imageH.size.height*0.5];
    
    //重新给button设置回去
    [self.loginBtn setBackgroundImage:imageH forState:UIControlStateHighlighted];
    
}






@end











