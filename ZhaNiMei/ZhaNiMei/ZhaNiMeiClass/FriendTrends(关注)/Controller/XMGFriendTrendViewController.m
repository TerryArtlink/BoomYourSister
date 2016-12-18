


//
//  XMGFriendTrendViewController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGFriendTrendViewController.h"

@interface XMGFriendTrendViewController ()

@end

@implementation XMGFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpNav];
}

- (void)setUpNav {
    self.navigationItem.title = @"我的关注";
    
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonitemWithImageName:@"friendsRecommentIcon" HighlightName:@"friendsRecommentIcon-click" target:self action:@selector(addFriend)];
}

- (void)addFriend {

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
