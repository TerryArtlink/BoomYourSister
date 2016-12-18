//
//  XMGEssenceController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/6.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGEssenceController.h"

@interface XMGEssenceController ()

@end

@implementation XMGEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpNav];
    NSLog(@"你乃别");
    
}

- (void)setUpNav {
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //左按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonitemWithImageName:@"nav_item_game_iconN" HighlightName:@"nav_item_game_click_iconN"
        target:self
        action:@selector(gameBtnClick)];
    
    //右按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonitemWithImageName:@"navigationButtonRandomN"
        HighlightName:@"navigationButtonRandomClickN"
        target:self
        action:@selector(randomBtnClick)];
}

- (void)gameBtnClick {
    NSLog(@"游戏按钮被点击");
}

- (void)randomBtnClick {
    NSLog(@"随机按钮被点击");
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
