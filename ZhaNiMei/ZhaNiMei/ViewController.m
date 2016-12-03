//
//  ViewController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/3.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"zhanimei");
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(50, 50, 50, 50);
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
