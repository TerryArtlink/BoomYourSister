//
//  XMGBaseController.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/19.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGBaseController.h"
#import "XMGBaseTopicController.h"

@interface XMGBaseController ()<UICollectionViewDataSource, UICollectionViewDelegate>

//标题栏
@property (nonatomic, weak) UIScrollView *titleView;
@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, weak) UICollectionView *collectView;

//
@property(nonatomic, strong)NSMutableArray *btns;
@property (nonatomic, weak) UIView *line;
@property(nonatomic, assign) BOOL isAddTitleBtn;

@end

//如果我们想要做出来效果
//1.把子控制器加上去
//2.设置我们标题栏的按钮
//3.点击按钮操作,-->让按钮进行点击 ->要让对应的子控制器的View添加到
//4.点击的时候,让collectionView滚动
//5.拖动结束,选中对应按钮

static NSString *const ID = @"cell";

@implementation XMGBaseController

- (NSMutableArray *)btns {
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (void)addAllChildVC {
    
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //1.添加viewcollectionView
    [self setUpContent];
    
    //2.添加标题view
    [self setUpTitleView];
    [self addAllChildVC];
    [self addAllTitleBtns];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView) name:@"TabBarItemClick" object:nil];
    
    self.titleView.scrollsToTop = NO;
    self.collectView.scrollsToTop = NO;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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

#pragma mark - 设置collectionView
-(void)setUpContent {
    //1.创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    layout.minimumInteritemSpacing = 0;
    
    //2.创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    self.collectView = collectionView;
    collectionView.backgroundColor = [UIColor grayColor];
    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}

#pragma mark - 设置标题栏
-(void)setUpTitleView {
    //scrollView
    UIScrollView *titleView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, XMGScreenW, 35)];
    
    titleView.backgroundColor = [UIColor whiteColor];
    
    self.titleView = titleView;
    
    [self.view addSubview:titleView];
    
}

#pragma mark - 添加标题栏按钮
-(void)addAllTitleBtns {
    //多少个按钮
    NSInteger count = self.childViewControllers.count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = XMGScreenW / count;
    CGFloat btnH = 35;
    
    for (int i = 0; i < count; i++) {
        btnX = i * btnW;
        UIViewController * VC = self.childViewControllers[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = i;
        [btn setTitle:VC.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [self.titleView addSubview:btn];
        [btn addTarget:self  action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btns addObject:btn];
        if (i == 0) {
            [self btnSelected:btn];
            
            //下划线
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = [UIColor redColor];
            line.xmg_h = 2;
            line.xmg_y = btn.xmg_h - line.xmg_h;
            [btn.titleLabel sizeToFit];
            line.xmg_w = btn.titleLabel.xmg_w;
            line.xmg_centerX = btn.xmg_centerX;
            self.line = line;
            [self.titleView addSubview:line];
        }
    }
}

#pragma mark - 按钮被选中
-(void)btnSelected:(UIButton *)btn {
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
}

#pragma mark - 刷新界面
-(void)refreshView {
    XMGBaseTopicController *vc = self.childViewControllers[_selectedBtn.tag];
    if (vc.view.window) {
        [vc.tableView.mj_header beginRefreshing];
    }
}

@end




















