//
//  UIView+AutoLayout.m
//  HJCLayout
//
//  Created by hjcool7 on 16/2/16.
//  Copyright © 2016年 hjcool7. All rights reserved.
//

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)

- (NSLayoutConstraint *)setSuperConstraint:(NSLayoutAttribute)attribute constant:(CGFloat)constant multiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:view attribute:attribute multiplier:multiplier constant:constant];
    [self.superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)setSelfConstraint:(NSLayoutAttribute)attribute  constant:(CGFloat)constant multiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:multiplier constant:constant];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)setAlignParentLeft
{
    return [self setLeftConstraint:0];
}

- (NSLayoutConstraint *)setLeftConstraint:(CGFloat)constant
{
    return [self setLeftConstraint:constant toView:self.superview];
}

- (NSLayoutConstraint *)setLeftConstraint:(CGFloat)constant toView:(UIView *)view
{
    return [self setLeftConstraint:constant relation:NSLayoutRelationEqual toView:view];
}

- (NSLayoutConstraint *)setLeftConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeLeading constant:constant multiplier:1 relation:relation toView:view];
}

- (NSLayoutConstraint *)setAlignParentRight
{
    return [self setRightConstraint:0];
}
- (NSLayoutConstraint *)setRightConstraint:(CGFloat)constant
{
    return [self setRightConstraint:constant toView:self.superview];
}
- (NSLayoutConstraint *)setRightConstraint:(CGFloat)constant toView:(UIView *)view
{
    return [self setRightConstraint:-constant relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setRightConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeTrailing constant:constant multiplier:1 relation:relation toView:view];
}

- (NSLayoutConstraint *)setAlignParentTop
{
    return [self setTopConstraint:0];
}
- (NSLayoutConstraint *)setTopConstraint:(CGFloat)constant
{
    return [self setTopConstraint:constant toView:self.superview];
}
- (NSLayoutConstraint *)setTopConstraint:(CGFloat)constant toView:(UIView *)view
{
    return [self setTopConstraint:constant relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setTopConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeTop constant:constant multiplier:1 relation:relation toView:view];
}

- (NSLayoutConstraint *)setAlignParentBottom
{
    return [self setBottomConstraint:0];
}
- (NSLayoutConstraint *)setBottomConstraint:(CGFloat)constant
{
    return [self setBottomConstraint:constant toView:self.superview];
}
- (NSLayoutConstraint *)setBottomConstraint:(CGFloat)constant toView:(UIView *)view
{
    return [self setBottomConstraint:-constant relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setBottomConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeBottom constant:constant multiplier:1 relation:relation toView:view];
}

- (NSLayoutConstraint *)setAlignParentCenterX
{
    return [self setCenterXConstraint:0];
}
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant
{
    return [self setCenterXConstraint:constant toView:self.superview];
}
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant toView:(UIView *)view
{
    return [self setCenterXConstraint:constant relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setCenterXConstraint:constant multiplier:1 relation:relation toView:view];
}
- (NSLayoutConstraint *)setCenterXConstraint:(CGFloat)constant multiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeCenterX constant:constant multiplier:multiplier relation:relation toView:view];
}

- (NSLayoutConstraint *)setAlignParentCenterY
{
    return [self setCenterYConstraint:0];
}
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant
{
    return [self setCenterYConstraint:constant toView:self.superview];
}
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant toView:(UIView *)view
{
    return [self setCenterYConstraint:constant relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setCenterYConstraint:constant multiplier:1 relation:relation toView:view];
}
- (NSLayoutConstraint *)setCenterYConstraint:(CGFloat)constant multiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeCenterY constant:constant multiplier:multiplier relation:relation toView:view];
}

- (NSArray<NSLayoutConstraint *> *)setAlignParentCenter
{
    return [self setCenterConstraint:CGPointZero];
}

- (NSArray<NSLayoutConstraint *> *)setCenterConstraint:(CGPoint)center
{
    NSLayoutConstraint *centerXConstraint = [self setCenterXConstraint:center.x];
    NSLayoutConstraint *centerYConstraint = [self setCenterYConstraint:center.y];
    return @[centerXConstraint,centerYConstraint];
}

- (NSArray<NSLayoutConstraint *> *)setEdgeConstraints:(UIEdgeInsets)edgeInset
{
    NSLayoutConstraint *topConstraint = [self setTopConstraint:edgeInset.top];
    NSLayoutConstraint *leftConstraint = [self setLeftConstraint:edgeInset.left];
    NSLayoutConstraint *bottomConstraint = [self setBottomConstraint:edgeInset.bottom];
    NSLayoutConstraint *rightConstraint = [self setRightConstraint:edgeInset.right];
    return @[topConstraint,leftConstraint,bottomConstraint,rightConstraint];
}

- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width
{
    return [self setWidthConstraint:width relation:NSLayoutRelationEqual];
}
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height
{
    return [self setHeightConstraint:height relation:NSLayoutRelationEqual];
}
- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width relation:(NSLayoutRelation)relation
{
    return [self setSelfConstraint:NSLayoutAttributeWidth constant:width multiplier:1 relation:relation];
}
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height relation:(NSLayoutRelation)relation;
{
    return [self setSelfConstraint:NSLayoutAttributeHeight constant:height multiplier:1 relation:relation];
}

- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width toView:(UIView *)view
{
    return [self setWidthConstraint:width multiplier:1 relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height toView:(UIView *)view
{
    return [self setHeightConstraint:height multiplier:1 relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width multiplier:(CGFloat)m toView:(UIView *)view
{
    return [self setWidthConstraint:width multiplier:m relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height multiplier:(CGFloat)m toView:(UIView *)view
{
    return [self setHeightConstraint:height multiplier:m relation:NSLayoutRelationEqual toView:view];
}
- (NSLayoutConstraint *)setWidthConstraint:(CGFloat)width multiplier:(CGFloat)m relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeWidth constant:width multiplier:m relation:relation toView:view];
}
- (NSLayoutConstraint *)setHeightConstraint:(CGFloat)height multiplier:(CGFloat)m relation:(NSLayoutRelation)relation toView:(UIView *)view
{
    return [self setSuperConstraint:NSLayoutAttributeHeight constant:height multiplier:m relation:relation toView:view];
}

- (NSArray<NSLayoutConstraint *> *)setSizeConstraint:(CGSize)size
{
    NSLayoutConstraint *widthConstraint = [self setWidthConstraint:size.width];
    NSLayoutConstraint *heightConstraint = [self setHeightConstraint:size.height];
    return @[widthConstraint,heightConstraint];
}

- (NSArray<NSLayoutConstraint *> *)setFrameConstraint:(CGRect)frame
{
    NSLayoutConstraint *topConstraint = [self setTopConstraint:frame.origin.y];
    NSLayoutConstraint *leftConstraint = [self setLeftConstraint:frame.origin.x];
    NSLayoutConstraint *widthConstraint = [self setWidthConstraint:frame.size.width];
    NSLayoutConstraint *heightConstraint = [self setHeightConstraint:frame.size.height];
    return @[leftConstraint,topConstraint,widthConstraint,heightConstraint];
}

- (NSLayoutConstraint *)setVerticalSpaceConstraint:(CGFloat)constant topView:(UIView *)topView
{
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topView attribute:NSLayoutAttributeBottom multiplier:1 constant:constant];
    [self.superview addConstraint:topConstraint];
    return topConstraint;
}

- (NSLayoutConstraint *)setVerticalSpaceConstraint:(CGFloat)constant bottomView:(UIView *)bottomView
{
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:bottomView attribute:NSLayoutAttributeTop multiplier:1 constant:-constant];
    [self.superview addConstraint:bottomConstraint];
    return bottomConstraint;
}

- (NSLayoutConstraint *)setHorizontalSpaceConstraint:(CGFloat)constant leftView:(UIView *)leftView
{
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:leftView attribute:NSLayoutAttributeTrailing multiplier:1 constant:constant];
    [self.superview addConstraint:leftConstraint];
    return leftConstraint;
}

- (NSLayoutConstraint *)setHorizontalSpaceConstraint:(CGFloat)constant rightView:(UIView *)rightView
{
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:rightView attribute:NSLayoutAttributeLeading multiplier:1 constant:-constant];
    [self.superview addConstraint:rightConstraint];
    return rightConstraint;
}

- (NSArray<NSLayoutConstraint *> *)setWidthMatchParentWithLeftPadding:(CGFloat)leftPadding rightPadding:(CGFloat)rightPadding
{
    NSLayoutConstraint *leftConstraint = [self setLeftConstraint:leftPadding];
    NSLayoutConstraint *rightConstraint = [self setRightConstraint:rightPadding];
    return @[leftConstraint,rightConstraint];
}
- (NSArray<NSLayoutConstraint *> *)setWidthMatchParentWithPadding:(CGFloat)padding;
{
    return [self setWidthMatchParentWithLeftPadding:padding rightPadding:padding];
}
- (NSArray<NSLayoutConstraint *> *)setWidthMatchParent
{
    return [self setWidthMatchParentWithPadding:0];
}
- (NSArray<NSLayoutConstraint *> *)setHeightMatchParentWithTopPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding
{
    NSLayoutConstraint *topConstraint = [self setTopConstraint:topPadding];
    NSLayoutConstraint *bottomConstraint = [self setBottomConstraint:bottomPadding];
    return @[topConstraint,bottomConstraint];
}
- (NSArray<NSLayoutConstraint *> *)setHeightMatchParentWithPadding:(CGFloat)padding
{
    return [self setHeightMatchParentWithTopPadding:padding bottomPadding:padding];
}
- (NSArray<NSLayoutConstraint *> *)setHeightMatchParent
{
    return [self setHeightMatchParentWithPadding:0];
}

@end
