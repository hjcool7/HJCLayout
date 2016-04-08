//
//  UIView+AutoLayout.h
//  HJCLayout
//
//  Created by hjcool7 on 16/2/16.
//  Copyright © 2016年 hjcool7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AutoLayout)

- (NSLayoutConstraint *)setAlignParentLeft;
- (NSLayoutConstraint *)setLeftConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)setLeftConstraint:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)setLeftConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view;

- (NSLayoutConstraint *)setAlignParentRight;
- (NSLayoutConstraint *)setRightConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)setRightConstraint:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)setRightConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view;

- (NSLayoutConstraint *)setAlignParentTop;
- (NSLayoutConstraint *)setTopConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)setTopConstraint:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)setTopConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view;

- (NSLayoutConstraint *)setAlignParentBottom;
- (NSLayoutConstraint *)setBottomConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)setBottomConstraint:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)setBottomConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view;

- (NSLayoutConstraint *)setAlignParentCenterX;
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view;
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant multiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation toView:(UIView *)view;

- (NSLayoutConstraint *)setAlignParentCenterY;
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant;
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant toView:(UIView *)view;
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view;
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant multiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation toView:(UIView *)view;

- (NSArray<NSLayoutConstraint *> *)setAlignParentCenter;
- (NSArray<NSLayoutConstraint *> *)setCenterConstraint:(CGPoint)center;

- (NSArray<NSLayoutConstraint *> *)setEdgeConstraints:(UIEdgeInsets)edgeInset;

- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width;
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height;
- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width relation:(NSLayoutRelation)relation;
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height relation:(NSLayoutRelation)relation;

- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width toView:(UIView *)view;
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height toView:(UIView *)view;
- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width multiplier:(CGFloat)m toView:(UIView *)view;
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height multiplier:(CGFloat)m toView:(UIView *)view;
- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width multiplier:(CGFloat)m relation:(NSLayoutRelation)relation toView:(UIView *)view;
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height multiplier:(CGFloat)m relation:(NSLayoutRelation)relation toView:(UIView *)view;

- (NSArray<NSLayoutConstraint *> *)setFrameConstraint:(CGRect)frame;
- (NSArray<NSLayoutConstraint *> *)setSizeConstraint:(CGSize)size;

- (NSLayoutConstraint *)setVerticalSpaceConstraint:(CGFloat)constant topView:(UIView *)topView;
- (NSLayoutConstraint *)setVerticalSpaceConstraint:(CGFloat)constant bottomView:(UIView *)bottomView;
- (NSLayoutConstraint *)setHorizontalSpaceConstraint:(CGFloat)constant leftView:(UIView *)leftView;
- (NSLayoutConstraint *)setHorizontalSpaceConstraint:(CGFloat)constant rightView:(UIView *)rightView;

- (NSArray<NSLayoutConstraint *> *)setWidthMatchParentWithLeftPadding:(CGFloat)leftPadding rightPadding:(CGFloat)rightPadding;
- (NSArray<NSLayoutConstraint *> *)setWidthMatchParentWithPadding:(CGFloat)padding;
- (NSArray<NSLayoutConstraint *> *)setWidthMatchParent;
- (NSArray<NSLayoutConstraint *> *)setHeightMatchParentWithTopPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding;
- (NSArray<NSLayoutConstraint *> *)setHeightMatchParentWithPadding:(CGFloat)padding;
- (NSArray<NSLayoutConstraint *> *)setHeightMatchParent;

@end

NS_ASSUME_NONNULL_END
