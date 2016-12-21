//
//  XMGAdViewController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGAdViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "XMGADmodel.h"
#import "AFHTTPSessionManager+XMGManager.h"
#import "XMGTabBarController.h"

#define iPhone6P XMGScreenH == 736
#define iPhone6  XMGScreenH == 667
#define iPhone5  XMGScreenH == 568
#define iPhone4  XMGScreenH == 480
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"


@interface XMGAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

//
@property(nonatomic, strong)XMGADmodel *adModel;
@property (weak, nonatomic) IBOutlet UIButton *skipBtn;

//
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation XMGAdViewController

//占位,控件多,控件层次确定,尺寸或者位置是不固定的
- (IBAction)skipBtn:(id)sender {
    
    //点击按钮,切换窗口的根控制器
    //设置窗口的根控制器
    XMGTabBarController *rootVc = [[XMGTabBarController alloc] init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = rootVc;
    
    [self.timer invalidate];
    self.timer = nil;
    
}

- (void)timerRunning {
    static int sec = 3;
    
    NSString *title = [NSString stringWithFormat:@"跳过(%d)", sec];
    
    [self.skipBtn setTitle:title forState:UIControlStateNormal];
    
    sec--;
    
    if (sec == -1) {
        [self skipBtn:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUpLaunchImage];
    
    [self loadData];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRunning) userInfo:nil repeats:YES];
    
    self.timer = timer;
    // 可以通过fire这个方法去触发timer，即使timer的firing time没有到达
    [timer fire];
}

- (void)setUpLaunchImage {
    //选取图片
    UIImage *image = nil;
    
    if (iPhone6P) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h"];
    }else if (iPhone6){
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (iPhone5){
        image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    }else if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage"];
    }
    
    self.launchImageView.image = image;
}

//获取网络数据
- (void)loadData {
    //1.创建网络请求管理者,想知道这个类有什么就跳到类里面去;你要是想知道这个方法做了什么事情,就跳到方法里面
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager xmg_manager];
    
    //2.拼接请求参数
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"code2"] = code2;
    
    NSString *url = @"http://mobads.baidu.com/cpro/ui/mads.php";
    
    //3.发送请求
    [mgr xmg_GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject ) {
        //分析数据
        [responseObject writeToFile:@"/ProjectDemo/BoomYourSister/ZhaNiMei/ZhaNiMei/ad.plist" atomically:YES];
        
        NSArray *adArr = responseObject[@"ad"];
        
        if (adArr.count == 0) {
            return;
        }
        
        NSDictionary *adDic = adArr.firstObject;
        
        //字典转模型
        XMGADmodel *adModel = [XMGADmodel mj_objectWithKeyValues:adDic];
        self.adModel = adModel;
        
        CGFloat h = adModel.h *XMGScreenW /adModel.w;
        
        CGRect frame = CGRectMake(0, 0, XMGScreenW, h);
        
        UIImageView *adImageView = [[UIImageView alloc] initWithFrame:frame];
        
        adImageView.userInteractionEnabled = YES;
        
        [self.contentView addSubview:adImageView];
        
        [adImageView sd_setImageWithURL:adModel.w_picurl.xmg_url];
        
        //给图片增加一个手势
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(AdViewBeClick)];
        [adImageView addGestureRecognizer:tapGes];
        

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)AdViewBeClick {
    if ([[UIApplication sharedApplication] canOpenURL:_adModel.ori_curl.xmg_url]) {
        [[UIApplication sharedApplication] openURL:_adModel.ori_curl.xmg_url];
    }
}



@end
