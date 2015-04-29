//
//  WRMenuViewController.m
//  抽屉效果
//
//  Created by apple on 15-4-29.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "WRMenuViewController.h"
#import "WRTableView.h"
#import "WRContentView.h"
#import "TitleBar.h"
#import "WRTableViewCell.h"
#import "WRSearchViewController.h"

#define BEGINAN_ANIMATION_DISTANCE  100
#define END_ANIMATION_DISTANCE      260

@interface WRMenuViewController () <UITableViewDataSource, UITableViewDelegate, TitleBarDelegate>

@property (weak, nonatomic) WRTableView *tableView;
@property (weak, nonatomic) WRContentView *contentView;

@end

@implementation WRMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setup {
    
    // 1.添加tableView
    WRTableView *tableView = [[WRTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
        
    [self.view addSubview:tableView];
    
    // 2.添加contentView
    WRContentView *view = [[WRContentView alloc] initWithFrame:self.view.bounds];
    
    self.contentView = view;
    view.titleBar.delegate = self;
    
    // 3.添加手势
    
    // Pan手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    [view addGestureRecognizer:panGestureRecognizer];
    
    // Tap手势
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    [view addGestureRecognizer:tapGestureRecognizer];
    
    [self.view addSubview:view];
}

#pragma mark - 手势回调
// 拖拽手势回调
- (void)handlePan:(UIPanGestureRecognizer *) panGestureRecognizer {
    
    CGPoint translation = [panGestureRecognizer translationInView:self.view];
    
    if (translation.x > 0) {
        
        self.contentView.center = CGPointMake(self.view.center.x + translation.x, self.view.center.y);
    }
    // 拖拽停止时
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            if (translation.x < BEGINAN_ANIMATION_DISTANCE) {// 回弹到原位置
                
                self.contentView.center = self.view.center;
                
            }else {// 右移到抽屉打开位置
                
                self.contentView.center = CGPointMake(self.view.center.x + END_ANIMATION_DISTANCE, self.view.center.y);
            }
        } completion:nil];
    }
}

// 点击手势回调
- (void)handleTap:(UITapGestureRecognizer *) tapGestureRecognizer {
    
    [self closeMenuView];
}

#pragma mark - 抽屉打开
- (void)openMenuView {
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.contentView.center = CGPointMake(self.view.center.x + END_ANIMATION_DISTANCE, self.view.center.y);
        
    } completion:nil];
}
#pragma mark - 抽屉复原
- (void)closeMenuView {
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.contentView.center = self.view.center;
        
    } completion:nil];
}

#pragma mark - TitleBar delegate
// 点击菜单按钮
- (void)titleBar:(TitleBar *)titleBar showMenuWith:(UIButton *)button {
    
    
    if (self.contentView.center.x == self.view.center.x) {
        
        [self openMenuView];
        
    } else {
        
        [self closeMenuView];
    }
}
// 点击搜索按钮
- (void)titlebar:(TitleBar *)titleBar searchWith:(UIButton *)button {

    WRSearchViewController *searchVC = [[WRSearchViewController alloc] init];
    
    [self presentViewController:searchVC animated:YES completion:nil];
}

#pragma mark - TableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [WRTableViewCell cellWithTableView:tableView indexPath:indexPath];
}
#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.contentView.backgroundColor = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.textColor;
    
    [self closeMenuView];
}
@end
