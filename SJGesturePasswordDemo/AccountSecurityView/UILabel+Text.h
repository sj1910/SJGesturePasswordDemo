//
//  UILabel+Text.h
//  LaiHuoLa
//
//  Created by 魏礼明 on 16/12/27.
//  Copyright © 2016年 Quincy-QC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Text)

- (void)lableText:(NSString *)string color:(unsigned int)hex font:(float)font textAlignment:(NSInteger)textAlignment;

- (void)lableText:(NSString *)string color:(unsigned int)hex alphe:(CGFloat)alphe font:(float)font textAlignment:(NSInteger)textAlignment;
@end
