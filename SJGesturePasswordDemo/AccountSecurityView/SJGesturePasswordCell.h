//
//  SJGestureCell.h
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.

#import <UIKit/UIKit.h>

@interface SJGesturePasswordCell : UICollectionViewCell

//item背景色
@property (nonatomic, strong) UIColor *itemBackGoundColor;
//item中间圆球的颜色
@property (nonatomic, strong) UIColor *itemCenterBallColor;
//手势选中
@property (nonatomic, assign) BOOL gestureSelected;

//线条错误状态的颜色 默认红色
@property (nonatomic, strong) UIColor *lineErrorColor;

@end
