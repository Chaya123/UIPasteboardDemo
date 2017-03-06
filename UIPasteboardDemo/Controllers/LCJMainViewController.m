//
//  LCJMainViewController.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/3.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "LCJMainViewController.h"
#import "LCJMainTableView.h"
//取得屏幕的宽、高
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LCJMainViewController()

@property(nonatomic,strong) LCJMainTableView *mainTableView;
@property(nonatomic,strong) NSArray *dataArray;
//@property(nonatomic,strong) UITextView *textView;

@end

@implementation LCJMainViewController

#pragma mark - lifeStyle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIPasteboard的用法";
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mainTableView];
    self.mainTableView.titleDataArray = self.dataArray;
    
}
#pragma mark - setter and getter

- (LCJMainTableView *)mainTableView{

    if (!_mainTableView) {
        _mainTableView = [[LCJMainTableView alloc]initWithFrame:self.view.frame];
    }
    return _mainTableView;
}

- (NSArray *)dataArray{

    if (!_dataArray) {
        //@"拷贝图片",@"系统已支持的view拷贝文字",@"自定义view拷贝文字",@"屏蔽系统已支持的View拷贝"
        _dataArray = @[@"LCJCopyImageVC",@"LCJSupportViewCopyTitleVC",@"LCJShieldViewCopyTitleVC"];
    }
    return _dataArray;
}

@end
