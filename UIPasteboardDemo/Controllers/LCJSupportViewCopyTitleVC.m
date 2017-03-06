//
//  LCJSupportViewCopyTitleVC.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "LCJSupportViewCopyTitleVC.h"

@interface LCJSupportViewCopyTitleVC ()

@property(nonatomic,strong) UITextView *textView;

@end

@implementation LCJSupportViewCopyTitleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textView];
}

- (UITextView *)textView{

    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:self.view.frame];
        _textView.text = @"You can copy image from browser or photo album and paste it to here. It support animated GIF and APNG. \n\nYou can also copy attributed string from other YYTextView.";
    }
    return _textView;
}

@end
