//
//  XMGMusicController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/27.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGMusicController.h"

@interface XMGMusicController ()

@end

@implementation XMGMusicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(TopicMidType)type {
    return TopicMidTypeMusic;
}

@end
