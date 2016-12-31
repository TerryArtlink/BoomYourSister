//
//  XMGUserCell.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/31.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGUserCell.h"
#import "XMGTrendUserModel.h"
#import <UIImageView+WebCache.h>

@interface XMGUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;



@end

@implementation XMGUserCell

-(void)setModel:(XMGTrendUserModel *)model {
    _model = model;
    
    [_iconImageView sd_setImageWithURL:model.header.xmg_url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //开启上下文
        
        if (image == nil) {
            return ;
        }
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        
        //2.设置裁剪区域
            //bezierPathWithOvalInRect 绘制圆形或椭圆形
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        
        //3.裁剪
        [clipPath addClip];
        
        //4.绘制图片
        [image drawAtPoint:CGPointZero];
        
        //5.拿到图片
            //UIGraphicsGetImageFromCurrentImageContext从当前上下文中获取图像
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        //6.关闭上下文
        UIGraphicsEndImageContext();
        
        //设置图片
        _iconImageView.image = newImage;
        
    }];
    
    _titleLabel.text = model.screen_name;
    
    //根据具体订阅的数字进行判断,然后拼接 @"23发个5"
    
    NSString *str = [NSString stringWithFormat:@"%@人订阅", model.fans_count];
    
    NSInteger num = 20000;//str.integerValue;
    
    if (num >= 10000) {
        CGFloat num1 = num/10000.0;
        str = [NSString stringWithFormat:@"%.1f万人订阅", num1];
    }
    
    //@"2.0 万人订阅2.0版本的新闻"
    str = [str stringByReplacingOccurrencesOfString:@".0" withString:@""];
    
    _desLabel.text = str;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

















