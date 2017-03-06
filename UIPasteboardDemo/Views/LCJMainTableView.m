//
//  LCJMainTableView.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "LCJMainTableView.h"
#import "UIView+LCJViewController.h"

@interface LCJMainTableView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSArray *subTitleArray;

@end

@implementation LCJMainTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    if (self = [super initWithFrame:frame style:style]) {
        
        self.dataSource = self;
        self.delegate = self;
        self.rowHeight = 44;
        self.backgroundColor = [UIColor whiteColor];
        // 每一组头部控件的高度
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

#pragma mark - delegate && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.titleDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.text = self.titleDataArray[indexPath.row];
    cell.detailTextLabel.text = self.subTitleArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.1f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *titleStr = self.titleDataArray[indexPath.row];
    Class class = NSClassFromString(titleStr);
    if (class) {
        
        UIViewController *ctrl = class.new;
        ctrl.title = titleStr;
        [self.viewController.navigationController pushViewController:ctrl animated:YES];
    }
}
- (void)setTitleDataArray:(NSArray *)titleDataArray{

    if (_titleDataArray != titleDataArray) {
        _titleDataArray = titleDataArray;
    }
}

- (NSArray *)subTitleArray{

    if (!_subTitleArray) {
        _subTitleArray = @[@"拷贝图片",@"系统已支持的view拷贝文字",@"屏蔽系统已支持的View拷贝"];
    }
    return _subTitleArray;
}

@end
