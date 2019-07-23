//
//  QQNewsViewController.m
//  MVVM
//
//  Created by Mac on 30/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsViewController.h"
#import "QQNewsCell.h"
#import "QQNewsListViewModel.h"
#import <TABAnimated.h>

@interface QQNewsViewController ()<UITableViewDataSource, UITableViewDelegate>

/// TableView
@property (nonatomic, strong) UITableView *tableView;
/// 新闻视图模型数组
@property (nonatomic, strong) QQNewsListViewModel *newsListViewModel;

@end

@implementation QQNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];

    [self.tableView tab_startAnimationWithDelayTime:3 completion:^{

        [self loadData];
    }];
}

#pragma mark - Load Data
- (void)loadData {

    [self.newsListViewModel loadNewsDataCompletion:^(BOOL isSuccessed) {

        if (!isSuccessed) {
            NSLog(@"%s 没有请求到数据", __FUNCTION__);
        }
//        [self.tableView reloadData];
        [self.tableView tab_endAnimationEaseOut];
    }];
}

#pragma mark - SetupUI
- (void)setupUI {

    self.navigationItem.title = @"新闻列表";
    [self tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsListViewModel.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    QQNewsCell *cell = [QQNewsCell newsCellWithTableView:tableView];
    cell.viewModel = self.newsListViewModel.newsList[indexPath.row];
    return cell;
}

#pragma mark - Getters and Setters
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 100;
        [self.view addSubview:_tableView];

//        // 设置tabAnimated相关属性
//        // 可以不进行手动初始化，将使用默认属性
//        _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:[QQNewsCell class]
//                                                              cellHeight:100];
//        _tableView.tabAnimated.animatedSectionCount = 3;
//        _tableView.tabAnimated.showTableHeaderView = YES;
//        _tableView.tabAnimated.categoryBlock = ^(UIView * _Nonnull view) {
//            view.animation(1).down(3).height(12);
//            view.animation(2).height(12).width(110);
//            view.animation(3).down(-5).height(12);
//        };
//
//        // 静态头视图扩展回调使用方法
//        _tableView.tableHeaderView.tabAnimated.categoryBlock = ^(UIView * _Nonnull view) {
//
//        };
        
        // 设置tabAnimated相关属性
        // 可以不进行手动初始化，将使用默认属性
        _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:[QQNewsCell class]
                                                              cellHeight:90];
        _tableView.tabAnimated.animatedSectionCount = 3;
        _tableView.tabAnimated.showTableHeaderView = YES;
        _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeDrop;
        
        // 新回调
        _tableView.tabAnimated.adjustBlock = ^(TABComponentManager * _Nonnull manager) {
            manager.animation(1).down(3).height(12);
            manager.animation(2).height(12).width(110);
            manager.animation(3).down(-5).height(12);
        };
        
        // 静态头视图扩展新回调使用方法
        _tableView.tableHeaderView.tabAnimated.adjustBlock = ^(TABComponentManager * _Nonnull manager) {
            
        };
    }
    return _tableView;
}

- (QQNewsListViewModel *)newsListViewModel {
    if (_newsListViewModel == nil) {
        _newsListViewModel = [[QQNewsListViewModel alloc] init];
    }
    return _newsListViewModel;
}

@end
