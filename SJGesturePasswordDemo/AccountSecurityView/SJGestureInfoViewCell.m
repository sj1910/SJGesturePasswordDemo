//
//  SJGestureInfoViewCell.m
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//
#import "SJGestureInfoViewCell.h"

@implementation SJGestureInfoViewCell
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
    self.layer.borderColor = RGBOF(0xD3D3D3).CGColor;
}

- (void)setGestureSelected:(BOOL)gestureSelected {
    if (gestureSelected) {//选中
        self.layer.borderWidth = 0;
        self.backgroundColor = _itemBackGoundColor;
    }else{//未选中
        self.layer.borderWidth = 1;
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setItemBackGoundColor:(UIColor *)itemBackGoundColor {
    _itemBackGoundColor = itemBackGoundColor;
}

@end
