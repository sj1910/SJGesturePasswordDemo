//
//  SJGestureCell.m
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "SJGesturePasswordCell.h"

@interface SJGesturePasswordCell () {
    UIView *_centerBall;
}
@end

@implementation SJGesturePasswordCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.layer.cornerRadius = self.bounds.size.height/2.0f;
    self.layer.masksToBounds = true;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = RGBOF(0x333333).CGColor;
    
    CGFloat dotW = self.bounds.size.width*0.3;
    _centerBall = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dotW, dotW)];
    _centerBall.center = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
    _centerBall.layer.cornerRadius = _centerBall.bounds.size.height/2.0f;
    _centerBall.layer.masksToBounds = true;
    [self addSubview:_centerBall];
}

- (void)setGestureSelected:(BOOL)gestureSelected {
    if (gestureSelected) {//选中
        self.layer.borderColor = RGBOF(0x4A94FF).CGColor;
        _centerBall.hidden = false;
    }else{//未选中
        self.layer.borderColor = RGBOF(0x333333).CGColor;
        _centerBall.hidden = true;
    }
}

- (void)setItemBackGoundColor:(UIColor *)itemBackGoundColor {
    _itemBackGoundColor = itemBackGoundColor;
}

- (void)setItemCenterBallColor:(UIColor *)itemCenterBallColor {
    _centerBall.backgroundColor = itemCenterBallColor;
}

//设置线条错误颜色
- (void)setLineErrorColor:(UIColor *)lineErrorColor {
    _lineErrorColor = lineErrorColor;
    _centerBall.backgroundColor = lineErrorColor;
    self.layer.borderColor = lineErrorColor.CGColor;

}

@end
