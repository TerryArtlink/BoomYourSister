
//
//  XMGNavController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/10.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGNavController.h"
#import "XMGNavBar.h"

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
