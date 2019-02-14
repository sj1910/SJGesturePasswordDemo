//
//  SetGesturePasswordTitleView.m
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "SetGesturePasswordTitleView.h"

@implementation SetGesturePasswordTitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        [la lableText:@"请设置新手势密码" color:0x333333 font:18 textAlignment:1];
        [self addSubview:la];
        
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 15)];
        [l lableText:@"设置后，您可通过新手势密码快捷登录" color:0x999999 font:14 textAlignment:1];
        [self addSubview:l];
    }
    return self;
}
@end
