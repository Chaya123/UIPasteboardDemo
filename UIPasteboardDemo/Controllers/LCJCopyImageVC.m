//
//  LCJCopyImageVC.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "LCJCopyImageVC.h"
#import "LCJCopyImageView.h"

@interface LCJCopyImageVC ()

@property(nonatomic,strong) LCJCopyImageView *copyingView;

@end

@implementation LCJCopyImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.copyingView];
}

- (LCJCopyImageView *)copyingView{

    if (!_copyingView) {
        _copyingView = [[LCJCopyImageView alloc]initWithFrame:self.view.frame];
    }
    return _copyingView;
}

@end
