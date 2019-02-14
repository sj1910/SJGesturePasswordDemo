//
//  SJGestureInfoViewCell.h
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJGestureInfoViewCell : UICollectionViewCell

//item背景色
@property (nonatomic, strong) UIColor *itemBackGoundColor;
//手势选中
@property (nonatomic, assign) BOOL gestureSelected;

@end
