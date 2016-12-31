//
//  XMGLoginRegistViewController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/29.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGLoginRegistViewController.h"
#import "XMGLoginView.h"


@interface XMGLoginRegistViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midViewCons;
@property (weak, nonatomic) IBOutlet UIView *midView;

//属性
@property (nonatomic, weak) XMGLoginView *loginView;
@property (nonatomic, weak) XMGLoginView *registerView;

@end
//看到界面,仔细分析,根据功能或者业务逻辑,或者就近原则,能分层次封装就分层次封装

@implementation XMGLoginRegistViewController
- (IBAction)loginRegisterBtnClick:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    //点击按钮的时候要做什么事情?两个子控件位移
    self.midViewCons.constant = self.midViewCons.constant == 0 ? -XMGScreenW : 0;
    //切换的动画效果
    [UIView animateWithDuration:0.25 animations:^{
        //如果你做的动画影响的是frame
            //约束
        [self.view layoutIfNeeded];
    }];
    
}
- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //登录的View
    XMGLoginView *loginView = [XMGLoginView loginView];
    self.loginView = loginView;
    [_midView addSubview:loginView];
    
    //登录的View
    XMGLoginView *registerView = [XMGLoginView registerView];
    self.registerView = registerView;
    [_midView addSubview:registerView];
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //在这个方法里,绝对可以拿到正确的尺寸,哪怕是控制器的View
    self.loginView.frame = CGRectMake(0, 0, XMGScreenW, _midView.xmg_h);
    self.registerView.frame = CGRectMake(XMGScreenW, 0, XMGScreenW, _midView.xmg_h);
}


@end
