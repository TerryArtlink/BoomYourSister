//
//  XMGTabBarController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/4.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTabBarController.h"
#import "XMGEssenceController.h"
#import "XMGNavController.h"
#import "XMGNewViewController.h"
#import "XMGPublishViewController.h"
#import "XMGFriendTrendViewController.h"
#import "XMGMineViewController.h"
#import "UIImage+XMGRender.h"


@interface XMGTabBarController ()

@property (nonatomic, weak) UIButton *publishBtn;

@end

@implementation XMGTabBarController

//只要程序启动,就加载到内存中去
//只会调用一次
+(void)load {
    //appearance方法可以修改这个类的所有实例特定的外观
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    
    NSMutableDictionary *attribu = [NSMutableDictionary dictionary];
    
    attribu[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [tabBarItem setTitleTextAttributes:attribu forState:UIControlStateNormal];
}

+(void)initialize {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor = [UIColor blackColor];
    //添加所有的子控制器
    [self setUpAllChildController];
    
    //设置子控制器的button
    [self setUpAllTabBarButtons];
    
    //懒加载publish按钮,并设置位置
    self.publishBtn.center = CGPointMake(self.tabBar.bounds.size.width * 0.5, self.tabBar.bounds.size.height * 0.5);
    
    //设置我们tabbar的背景图片
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
}

- (UIButton *)publishBtn {
    if (_publishBtn == nil) {
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _publishBtn = publishBtn;
        //设置图片
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        //设置高亮图片
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        //自适应宽度
        [publishBtn sizeToFit];
        //
        [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //
        [self.tabBar addSubview:publishBtn];
  
    }
    return _publishBtn;
}

//发布按钮被点击
- (void)publishBtnClick {
    
}

//添加所有的子控制器
- (void)setUpAllChildController {
    //1.精华控制器
    XMGEssenceController *vc0 = [[XMGEssenceController alloc] init];
    vc0.view.backgroundColor = [UIColor redColor];
    
    //导航控制器,在实例化的时候,会把它的根控制器压入到栈中
    XMGNavController *nav0 = [[XMGNavController alloc] initWithRootViewController:vc0];
    [self addChildViewController:nav0];
    
    //新帖
    XMGNewViewController *vc1 = [[XMGNewViewController alloc] init];
    
    vc1.view.backgroundColor = [UIColor whiteColor];
    
    XMGNavController *nav1 = [[XMGNavController alloc] initWithRootViewController:vc1];
    
    [self addChildViewController:nav1];
    
    //3.发布
    XMGPublishViewController *vc2 = [[XMGPublishViewController alloc] init];
    
    vc2.view.backgroundColor = [UIColor grayColor];
    
    [self addChildViewController:vc2];
    
    //4.关注
    XMGFriendTrendViewController *vc3 = [[XMGFriendTrendViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    XMGNavController *nav3 = [[XMGNavController alloc] initWithRootViewController:vc3];
    [self addChildViewController:nav3];
    
    //5
    XMGMineViewController *vc4 = [[XMGMineViewController alloc] init];
    vc3.view.backgroundColor = [UIColor yellowColor];
    XMGNavController *nav4 = [[XMGNavController alloc] initWithRootViewController:vc4];
    [self addChildViewController:nav4];
}

- (void)setUpAllTabBarButtons {
    //0
    UINavigationController *vc0 = self.childViewControllers[0];
    
    vc0.tabBarItem.title = @"精华";
    
    vc0.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_essence_icon"];
    
    vc0.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_essence_click_icon"];
    
    //1
    UINavigationController *vc1 = self.childViewControllers[1];
    vc1.tabBarItem.title = @"新帖";
    vc1.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_new_icon"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_new_click_icon"];
    
    //2
    UIViewController *vc2 = self.childViewControllers[2];
    vc2.tabBarItem.enabled = NO;
    
    //3
    UINavigationController *vc3 = self.childViewControllers[3];
    vc3.tabBarItem.title = @"关注";
    vc3.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_friendTrends_icon"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_friendTrends_click_icon"];
    
    //4
    UINavigationController *vc4 = self.childViewControllers[4];
    vc4.tabBarItem.title = @"我";
    vc4.tabBarItem.image = [UIImage imageNamedWithRenderName:@"tabBar_me_icon"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamedWithRenderName:@"tabBar_me_click_icon"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
