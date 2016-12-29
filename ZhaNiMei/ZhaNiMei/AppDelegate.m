//
//  AppDelegate.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/3.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "AppDelegate.h"
#import "XMGAdViewController.h"
#import "XMGTabBarController.h"

@interface AppDelegate ()
//醉了
@property(nonatomic, strong)UIWindow *window1;
@end

//点击状态栏不能滚动到顶部
//原因屏幕里有多个ScrollView
//让你滚动?--在哪里调用方法
//做什么事情滚动

@implementation AppDelegate
//1.在代理里面添加广告界面-->添加到什么地方(根控制器)-->window
//2.启动完成的时候添加广告界面--
//3.我们先把广告控制器设置为我window的根控制器

//启动界面,截屏的(静态的),不可行


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1.创建一个窗口
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window = window;
    
    //2.设置窗口的跟控制器
#warning 打包上架的时候换过来
    XMGTabBarController *rootVC = [[XMGTabBarController alloc] init];
#warning 新帖结束改过来
    window.rootViewController = rootVC;
    
    //3.显示窗口
    //set tabBar as key
    [window makeKeyAndVisible];

    [UIApplication sharedApplication].statusBarHidden = NO;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
