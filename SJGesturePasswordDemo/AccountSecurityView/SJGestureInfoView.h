//
//  SJGestureInfoView.h
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface SJGestureInfoView : UIView
//选中颜色
@property (nonatomic, strong) UIColor *itemBackGoundColor;
//要显示的密码
@property (nonatomic, copy) NSString *passWord;
//重新输入
- (void)refresh;

@end
