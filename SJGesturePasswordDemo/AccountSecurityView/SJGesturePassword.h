//
//  SJGesturePassword.h
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef void(^PasswordBlock)(NSString *password);

@interface SJGesturePassword : UIView
//item背景色 默认浅灰色
@property (nonatomic, strong) UIColor *itemBackGoundColor;
//item中间圆球的颜色 默认灰色
@property (nonatomic, strong) UIColor *itemCenterBallColor;
//线条正常状态的颜色 默认灰色
@property (nonatomic, strong) UIColor *lineNormalColor;
//线条错误状态的颜色 默认红色
@property (nonatomic, strong) UIColor *lineErrorColor;
//重新输入
- (void)refresh;
//错误
- (void)showError;
//密码回调
- (void)addPasswordBlock:(PasswordBlock)passwordBlock;
@end
