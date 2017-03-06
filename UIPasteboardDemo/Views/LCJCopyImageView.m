//
//  LCJCopyImageView.m
//  UIPasteboardDemo
//
//  Created by liu on 2017/3/3.
//  Copyright © 2017年 lcj. All rights reserved.
//


#import "LCJCopyImageView.h"

/**
 支持
 支持UIPasteboard原生控件只有UITextField 、UITextView、UIWebView这三个
 如果想自定义一个控件能够使用UIPasteboard，需要在定义的时候重载 
 -(BOOL)canBecomeFirstResponder   为了能接收到事件（能成为第一响应者）
 -(BOOL)canPerformAction:(SEL)action withSender:(id)sender  删选出需要的功能
 这两个方法
 */
@interface LCJCopyImageView()

@property(nonatomic,strong) UIImageView *imageView1;/**<第一个图片View*/

@property(nonatomic,strong) UIImageView *imageView2;/**<第二个图片View*/


@end

@implementation LCJCopyImageView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.imageView1];
        [self addSubview:self.imageView2];
    }
    return self;
}

-(BOOL)canBecomeFirstResponder{
    
    return YES;
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//    NSArray* methodNameArr = @[@"copy:",@"cut:",@"select:",@"selectAll:",@"paste:"];
    NSArray* methodNameArr = @[@"copy:",@"paste:"];
    if ([methodNameArr containsObject:NSStringFromSelector(action)]) {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

#pragma mark - action
//如果允许这些功能，就得实现方法，不然会崩溃
-(void)copy:(id)sender{
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setImage:self.imageView1.image];
}
//粘贴
-(void)paste:(id)sender{
    
    UIPasteboard* pasteboard = [UIPasteboard generalPasteboard];
    self.imageView2.image = [pasteboard image];
}
//手势响应方法
- (void)pressClick:(UILongPressGestureRecognizer *)recognizer{

    if(recognizer.state == UIGestureRecognizerStateBegan){
        
        [self becomeFirstResponder];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setTargetRect:recognizer.view.frame inView:self];
        [menuController setMenuVisible:YES animated:YES];
    }
    
}

#pragma mark - setter and getter

- (UIImageView *)imageView1{

    if (!_imageView1) {
        
        _imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 80, 100, 100)];
        UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(pressClick:)];
        press.minimumPressDuration = 1;
        _imageView1.userInteractionEnabled = YES;
        [_imageView1 addGestureRecognizer:press];
        _imageView1.image = [UIImage imageNamed:@"SDMDealing"];
    }
    return _imageView1;
}

- (UIImageView *)imageView2{
    
    if (!_imageView2) {
        
        _imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 240, 100, 100)];
        UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(pressClick:)];
        press.minimumPressDuration = 1;
        _imageView2.userInteractionEnabled = YES;
        [_imageView2 addGestureRecognizer:press];
        _imageView2.backgroundColor = [UIColor lightGrayColor];
    }
    return _imageView2;
}
@end
