//
//  UITextField+LCJShieldCopy.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/6.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "UITextField+LCJShieldCopy.h"

@implementation UITextField (LCJShieldCopy)

#pragma mark - 禁用所有长按文本框操作
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    return NO;
}


@end
