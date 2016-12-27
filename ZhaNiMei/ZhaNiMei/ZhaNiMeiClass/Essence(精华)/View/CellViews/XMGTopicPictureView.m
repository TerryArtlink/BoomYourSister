//
//  XMGTopicPictureView.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/22.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTopicPictureView.h"
#import <UIImageView+WebCache.h>
#import "XMGTopicModel.h"
#import <SDImageCache.h>
#import <DALabeledCircularProgressView.h>
#import "XMGSeeBigPictureController.h"

@interface XMGTopicPictureView ()

@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;

@property (weak, nonatomic) IBOutlet UIImageView *topicPictureView;

@property (weak, nonatomic) IBOutlet UIButton *seeBigBtn;


@end


@implementation XMGTopicPictureView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.progressView.backgroundColor = [UIColor lightGrayColor];
    self.progressView.roundedCorners = YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    XMGSeeBigPictureController *VC = [[XMGSeeBigPictureController alloc] init];
    
    VC.model = self.model;
    VC.view.backgroundColor = [UIColor whiteColor];
    [self.window.rootViewController presentViewController:VC animated:YES completion:nil];
}

-(void)setModel:(XMGTopicModel *)model {
    [super setModel:model];
    
    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:model.image0];
    if (image && (image.size.width <= XMGScreenW - 20)) {
        [self.topicPictureView sd_setImageWithURL:model.image0.xmg_url];
    }else {
        [self.topicPictureView sd_setImageWithURL:model.image0.xmg_url placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            if (expectedSize <= 0) {
                return;
            }
            CGFloat progress = 1.0 * receivedSize / expectedSize;
            //能够获得进度值
            self.progressView.progress = progress;
            
            self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.021f%%", progress * 100];
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            if (!model.is_bigPic) {
                return ;
            }
            if (!image) {
                return;
            }
            
            //裁剪图片
            CGFloat imageW = XMGScreenW - 20;
            CGFloat imageH = imageW / model.width * model.height;
            
            //开启上下文
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0);
            
            //绘图
            [image drawInRect:CGRectMake(0, 0, imageW, imageH)];
            
            //获取图片
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            
            //关闭上下文
            UIGraphicsEndImageContext();
            
            //控件重新赋值
            self.topicPictureView.image = newImage;
            
            //存入缓存
            [[SDImageCache sharedImageCache] storeImage:newImage forKey:model.image0];
            
        }];
    }//结束if
    
    //判断是否是动图,动图显示标示
    self.gifImageView.hidden = !model.is_gif;
    
    //判断是否是大图,是大图显示查看大图按钮
    self.seeBigBtn.hidden = !model.is_bigPic;
    
    //大图的时候
    if (model.is_bigPic) {
        self.topicPictureView.contentMode = UIViewContentModeTop;
        self.topicPictureView.clipsToBounds = YES;
    }else {
        self.topicPictureView.contentMode = UIViewContentModeScaleToFill;
        self.topicPictureView.clipsToBounds = NO;
    }
    
    //小图的时候
    //do nothing
    
}

@end
