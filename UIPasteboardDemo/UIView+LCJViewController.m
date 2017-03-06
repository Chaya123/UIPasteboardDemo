//
//  UIView+LCJViewController.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/5.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "UIView+LCJViewController.h"

@implementation UIView (LCJViewController)

- (UIViewController *)viewController
{
    UIViewController *viewController = nil;
    UIResponder *next = self.nextResponder;
    while (next)
    {
        if ([next isKindOfClass:[UIViewController class]])
        {
            viewController = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    }
    return viewController;
}

@end
