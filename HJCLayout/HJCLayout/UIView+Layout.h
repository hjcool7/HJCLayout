//
//  UIView+Layout.h
//  HJCLayout
//
//  Created by hjcool7 on 16/2/16.
//  Copyright © 2016年 hjcool7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layout)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic,getter = y,setter = setY:) CGFloat top;
@property (nonatomic,getter = x,setter = setX:) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGSize size;
@property (nonatomic) CGPoint origin;

@end
