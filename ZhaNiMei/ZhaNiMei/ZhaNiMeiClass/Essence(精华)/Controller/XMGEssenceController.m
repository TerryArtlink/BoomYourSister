//
//  XMGEssenceController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/6.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGEssenceController.h"

#import "XMGAllController.h"
#import "XMGVideoController.h"
#import "XMGMusicController.h"
#import "XMGPictureController.h"
#import "XMGTextController.h"

@interface XMGEssenceController ()

@end

@implementation XMGEssenceController

//1.cell不等高
//2.cell类型多
//3.结构类似,-->中间部分
//4.分割层次-->1.topView 2.midView 3.commentView 4.toolView


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpNav];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


#pragma mark - 添加子控制器
-(void)addAllChildVC{
    //1.添加子控制器
    
    //1.全部
    XMGAllController* allVC = [[XMGAllController alloc] init];
    allVC.title =@"全部";
    
    [self addChildViewController:allVC];
    //2.视频
    XMGVideoController* videoVC = [[XMGVideoController alloc] init];
    videoVC.view.backgroundColor = [UIColor redColor];
    videoVC.title =@"视频";
    
    [self addChildViewController:videoVC];
    
    //3.声音
    XMGMusicController * musicVC = [[XMGMusicController alloc] init];
    musicVC.title =@"声音";
    
    [self addChildViewController:musicVC];
    
    //4.图片
    XMGPictureController* picVC = [[XMGPictureController alloc] init];
    picVC.title =@"图片";
    
    [self addChildViewController:picVC];
    
    
    //段子
    XMGTextController* textVC = [[XMGTextController alloc] init];
    textVC.title =@"段子";
    
    [self addChildViewController:textVC];
    
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
