
//
//  XMGNavController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/10.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGNavController.h"
#import "XMGNavBar.h"
#import "XMGBackView.h"

@interface XMGNavController ()

@end

@implementation XMGNavController

+ (void)load {
    //设置我们的标题
    UINavigationBar *bar = [UINavigationBar appearance];
    
    NSMutableDictionary *attribu = [NSMutableDictionary dictionary];
    
    attribu[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    
    [bar setTitleTextAttributes:attribu];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XMGNavBar *bar = [[XMGNavBar alloc] init];
    
    [self setValue:bar forKey:@"navigationBar"];
    
    //我们手势被触发的时候执行,target的action方法
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *fullScreenGes = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:fullScreenGes];
    
    fullScreenGes.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //等于0的时候,是正在push根控制器
    if (self.childViewControllers.count > 0) { //非根控制器
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[XMGBackView backViewWithImageName:@"navigationButtonReturn" HighlightName:@"navigationButtonReturnClick" target:self action:@selector(back)]];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back {
    [self popViewControllerAnimated:YES];
}

#pragma mark UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(nonnull UITouch *)touch {
    //判断是否是根控制器
    return self.childViewControllers.count > 1;
}

@end
