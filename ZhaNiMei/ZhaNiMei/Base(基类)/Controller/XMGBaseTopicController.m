//
//  XMGBaseTopicController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGBaseTopicController.h"
#import "XMGTopicCell.h"
#import "AFHTTPSessionManager+XMGManager.h"
#import <MJExtension.h>
#import "XMGTopicModel.h"
#import "XMGTopicViewModel.h"
#import "XMGNewViewController.h"

@interface XMGBaseTopicController ()

//数据源
@property(nonatomic, strong)NSMutableArray *topicViewModels;
@property(nonatomic, strong)NSString *maxtime;

@property(nonatomic, assign) UIEdgeInsets OriInsets;

//
@property(nonatomic, strong)AFHTTPSessionManager *mgr;


@end

@implementation XMGBaseTopicController

//viewModel数组
-(AFHTTPSessionManager *)mgr {
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager xmg_manager];
    }
    return _mgr;
}

-(NSMutableArray *)topicViewModels {
    if (!_topicViewModels) {
        _topicViewModels = [NSMutableArray array];
    }
    return _topicViewModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[XMGTopicCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    [self loadData];
    UIEdgeInsets OriInsets = UIEdgeInsetsMake(99, 0, 49, 0);
    self.OriInsets = OriInsets;
    self.tableView.scrollIndicatorInsets = OriInsets;
    //上拉刷新
    //1.加上去控件
    //2.监听滚动
    //3.发送网络请求
    [self setUpFooterRefreshView];
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

-(void)loadData {
    //清空之前的请求任务
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    //拼接请求参数
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSString *a = @"list";
    if ([self.parentViewController isKindOfClass:[XMGNewViewController class]]) {
        a = @"newlist";
    }
    
    dic[@"a"] = a;
    dic[@"c"] = @"data";
    dic[@"type"] = @(self.type);
    
    [self.mgr xmg_GET:XMGBaseUrl parameters:dic progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        //设置回去tableView的内边距
        self.tableView.contentInset = _OriInsets;
        
        [self.tableView.mj_header endRefreshing];
        
        _maxtime = responseObject[@"info"][@"maxtime"];
        
        //拿到字典数组
        NSArray *dicList = responseObject[@"list"];
        
        //字典转模型
        NSMutableArray *list = [XMGTopicModel mj_objectArrayWithKeyValuesArray:dicList];
        
        //数据模型转换为viewModel模型
        [self.topicViewModels removeAllObjects];
        
        for (XMGTopicModel *model in list) {
            XMGTopicViewModel *viewModel = [[XMGTopicViewModel alloc] init];
            viewModel.model = model;
            [self.topicViewModels addObject:viewModel];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        xmglog(@"%@",error)
        [self.tableView.mj_header endRefreshing];
    }];
}


//上啦刷新
-(void)setUpFooterRefreshView {
    //搞一个控件加上去
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

-(void)loadMoreData {
    //1.创建请求管理者
    [self.mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    //拼接请求参数
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"a"] = @"list";
    dic[@"c"] = @"data";
    dic[@"type"] = @(self.type);
    dic[@"maxtime"] = _maxtime;
    //发送请求
}

@end
