//
//  LCJShieldViewCopyTitleVC.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "LCJShieldViewCopyTitleVC.h"

@interface LCJShieldViewCopyTitleVC ()

@property(nonatomic,strong) UITextField *textField;

@end

@implementation LCJShieldViewCopyTitleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.textField];
}
/*若想屏蔽复制、粘贴等功能，可以写成分类将整一类屏蔽，如果只想屏蔽这一个，就可以重写一个View继承自这个控件，实现以下方法 即可
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {return NO;}

 */
- (UITextField *)textField{
    
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:self.view.frame];
        _textField.text = @"You can copy image.";
    }
    return _textField;
}

@end
