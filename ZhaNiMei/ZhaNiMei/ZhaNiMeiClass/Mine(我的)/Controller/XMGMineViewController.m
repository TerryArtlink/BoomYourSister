//
//  XMGMineViewController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/12.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGMineViewController.h"
#import "XMGSettingController.h"

@interface XMGMineViewController ()

@end

@implementation XMGMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setUpNav];
}

- (void)setUpNav {
    self.navigationItem.title = @"我的";
    //左侧按钮
    //夜间按钮
    UIBarButtonItem *nightBtn = [UIBarButtonItem barButtonitemWithImageName:@"mine-moon-icon" selectedName:@"mine-moon-icon-click" target:self action:@selector(nightBtnClick:)];
    //设置按钮
    UIBarButtonItem *settingBtn = [UIBarButtonItem barButtonitemWithImageName:@"mine-setting-icon" HighlightName:@"mine-setting-icon-click" target:self action:@selector(settingBtnClick)];
}
//设置按钮被点击
- (void)settingBtnClick {
    XMGSettingController *settingVC = [[XMGSettingController alloc] init];
    
    settingVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)nightBtnClick:(UIButton *)btn {
    btn.selected = !btn.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
