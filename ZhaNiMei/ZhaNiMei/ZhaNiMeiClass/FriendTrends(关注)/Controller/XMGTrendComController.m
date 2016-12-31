//
//  XMGTrendComController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/30.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGTrendComController.h"
#import "XMGCategoryCell.h"
#import "XMGUserCell.h"
#import "AFHTTPSessionManager+XMGManager.h"
#import "XMGCategoryModel.h"
#import "XMGTrendUserModel.h"
#import <MJExtension.h>
#import <MJRefresh.h>

@interface XMGTrendComController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@property(nonatomic, strong) XMGCategoryModel *selectedModel;

//
@property(nonatomic, strong) NSArray *categoryArr;
@property(nonatomic, strong) NSMutableArray *userArr;
@property(nonatomic, strong) AFHTTPSessionManager *mgr;

@end

static NSString *categoryID = @"category";
static NSString *userID = @"user";


@implementation XMGTrendComController

-(AFHTTPSessionManager *)mgr {
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager xmg_manager];
    }
    return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //当设置为YES时（默认YES），如果视图里面存在唯一一个UIScrollView或其子类View，那么它会自动设置相应的内边距，这样可以让scroll占据整个视图，又不会让导航栏遮盖。
    self.automaticallyAdjustsScrollViewInsets = NO;
    //调整分类View的额外滚动区域
    _categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    //设置数据源和代理
    _categoryTableView.delegate = self;
    _categoryTableView.dataSource = self;
    [_categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGCategoryCell class]) bundle:nil] forCellReuseIdentifier:categoryID];
    
    //调整用户View的额外滚动区域
    _userTableView.contentInset = _categoryTableView.contentInset;
    _userTableView.delegate = self;
    _userTableView.dataSource = self;
    [_userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGUserCell class]) bundle:nil] forCellReuseIdentifier:userID];
    
    [self loadCategoryData];
    
    //设置上下拉刷新
    [self setUpHeaderfooter];
    
}


//设置上下拉刷新
-(void)setUpHeaderfooter {
    //搞一个控件加上去
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUserData)];
    _userTableView.mj_footer = footer;
    footer.automaticallyHidden = YES;
    
    //搞一个控件加上去
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadUserData)];
    _userTableView.mj_header = header;
    [_userTableView.mj_header beginRefreshing];
    header.automaticallyChangeAlpha = YES;
}


#pragma mark - loadCategoryData
-(void)loadCategoryData {
    //拼接请求参数 category subscribe
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"a"] = @"category";
    dic[@"c"] = @"subscribe";
    
    //发送请求
    [self.mgr xmg_GET:XMGBaseUrl parameters:dic progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        _categoryArr = [XMGCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [_categoryTableView reloadData];
        
        //默认选中第0个
        NSIndexPath *indx = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [_categoryTableView selectRowAtIndexPath:indx animated:YES scrollPosition:UITableViewScrollPositionNone];
        
        [self tableView:_categoryTableView didSelectRowAtIndexPath:indx];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (tableView == _categoryTableView) {
        _selectedModel = self.categoryArr[indexPath.row];
        if (_selectedModel.alreadyLoadArr == 0) {
            //请求右侧用户数
            [self loadUserData];
        }
    }
}

#pragma mark - loadUserData
-(void)loadUserData {
    //创建网络请求管理者
    
    //拼接请求参数 category subscribe
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"a"] = @"list";
    dic[@"c"] = @"subscribe";
    dic[@"category_id"] = _selectedModel.id;
    _selectedModel.page = 1;
    //发送请求
    [self.mgr xmg_GET:XMGBaseUrl parameters:dic progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        _selectedModel.page ++;
        [_userTableView.mj_header endRefreshing];
        _selectedModel.alreadyLoadArr = [XMGTrendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        _selectedModel.total_page = [responseObject[@"total_page"] integerValue];
        
        [_userTableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [_userTableView.mj_header endRefreshing];
        
    }];
}

#pragma mark - loadMoreUserData
-(void)loadMoreUserData {
    //拼接请求参数 category subscribe
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"a"] = @"list";
    dic[@"c"] = @"subscribe";
    dic[@"category_id"] = _selectedModel.id;
    dic[@"page"] = @(_selectedModel.page);
    
    //发送请求
    [self.mgr xmg_GET:XMGBaseUrl parameters:dic progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        
        [_userTableView.mj_footer endRefreshing];
        NSArray *moreArr = [XMGTrendUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        _selectedModel.page ++;
        [_selectedModel.alreadyLoadArr addObjectsFromArray:moreArr];
        
        [_userTableView reloadData];
        _userTableView.mj_footer.hidden = _selectedModel.total_page < _selectedModel.page;
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [_userTableView.mj_footer endRefreshing];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == _categoryTableView) {
        return _categoryArr.count;
    }
    
    return _selectedModel.alreadyLoadArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _categoryTableView) {
        XMGCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryID];
        cell.model = _categoryArr[indexPath.row];
        return cell;
    }else if (tableView == _userTableView) {
        XMGUserCell *cell = [tableView dequeueReusableCellWithIdentifier:userID];
        cell.model = _selectedModel.alreadyLoadArr[indexPath.row];
        
        return cell;
    }
    
    return nil;
}

@end





















