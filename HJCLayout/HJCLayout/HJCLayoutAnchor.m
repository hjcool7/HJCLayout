//
//  HJCLayoutAnchor.m
//  HJCLayout
//
//  Created by hjcool7 on 16/2/17.
//  Copyright © 2016年 hjcool7. All rights reserved.
//

#import "HJCLayoutAnchor.h"
#import <objc/runtime.h>

@interface HJCLayoutAnchor<AnchorType>()

@property (nonatomic) NSLayoutAttribute layoutAttribute;
@property (nonatomic,weak) UIView *view;

- (NSLayoutConstraint *)constraintWithAnchor:(HJCLayoutAnchor *)anchor relation:(NSLayoutRelation)relation multiplier:(CGFloat)m constant:(CGFloat)c;

@end

@implementation HJCLayoutAnchor

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutAnchor *)anchor
{
    return [self constraintEqualToAnchor:anchor constant:0];
}
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutAnchor *)anchor
{
    return [self constraintGreaterThanOrEqualToAnchor:anchor constant:0];
}
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutAnchor *)anchor
{
    return [self constraintLessThanOrEqualToAnchor:anchor constant:0];
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutAnchor *)anchor constant:(CGFloat)c
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationEqual multiplier:1 constant:c];
}
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutAnchor *)anchor constant:(CGFloat)c
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationGreaterThanOrEqual multiplier:1 constant:c];
}
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutAnchor *)anchor constant:(CGFloat)c
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationLessThanOrEqual multiplier:1 constant:c];
}

- (NSLayoutConstraint *)constraintWithAnchor:(HJCLayoutAnchor *)anchor relation:(NSLayoutRelation)relation multiplier:(CGFloat)m constant:(CGFloat)c
{
    NSLayoutConstraint *constraint = nil;
    if (anchor)
    {
        if ([anchor isKindOfClass:[self class]])
        {
            return nil;
        }
        constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.layoutAttribute relatedBy:relation toItem:anchor.view attribute:anchor.layoutAttribute multiplier:m constant:c];
    }
    else
    {
        constraint = [NSLayoutConstraint constraintWithItem:self.view attribute:self.layoutAttribute relatedBy:relation toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:m constant:c];
    }

    return constraint;
}

@end

@implementation HJCLayoutXAxisAnchor

@end

@implementation HJCLayoutYAxisAnchor

@end

@implementation HJCLayoutDimension

- (NSLayoutConstraint *)constraintEqualToConstant:(CGFloat)c
{
    return [self constraintWithAnchor:nil relation:NSLayoutRelationEqual multiplier:1 constant:c];
}
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToConstant:(CGFloat)c
{
    return [self constraintWithAnchor:nil relation:NSLayoutRelationGreaterThanOrEqual multiplier:1 constant:c];
}
- (NSLayoutConstraint *)constraintLessThanOrEqualToConstant:(CGFloat)c
{
    return [self constraintWithAnchor:nil relation:NSLayoutRelationLessThanOrEqual multiplier:1 constant:c];
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationEqual multiplier:m constant:0];
}
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationGreaterThanOrEqual multiplier:m constant:0];
}
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationLessThanOrEqual multiplier:m constant:0];
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationEqual multiplier:m constant:c];
}
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationGreaterThanOrEqual multiplier:m constant:c];
}
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
    return [self constraintWithAnchor:anchor relation:NSLayoutRelationLessThanOrEqual multiplier:m constant:c];
}

@end

static const char * kNSLayoutConstraintActiveKey;

@implementation NSLayoutConstraint(HJCLayout)

- (void)setHjc_active:(BOOL)hjc_active
{
    objc_setAssociatedObject(self, &kNSLayoutConstraintActiveKey, @(hjc_active), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIView *superView = nil;
    if ([self.firstItem isKindOfClass:[UIView class]])
    {
        if (self.secondItem && [self.secondItem isKindOfClass:[UIView class]])
        {
            superView = [(UIView *)self.firstItem superview];
        }
        else
        {
            superView = self.firstItem;
        }
    }

    if (!superView)
    {
        return;
    }
    
    if (hjc_active)
    {
        [superView addConstraint:self];
    }
    else
    {
        [superView removeConstraint:self];
    }
}

- (BOOL)hjc_active
{
    return [objc_getAssociatedObject(self, &kNSLayoutConstraintActiveKey) boolValue];
}

@end

static const char * kUIViewLeadingAnchorKey;
static const char * kUIViewTrailingAnchorKey;
static const char * kUIViewLeftAnchorKey;
static const char * kUIViewRightAnchorKey;
static const char * kUIViewTopAnchorKey;
static const char * kUIViewBottomAnchorKey;
static const char * kUIViewWidthAnchorKey;
static const char * kUIViewHeightAnchorKey;
static const char * kUIViewCenterXAnchorKey;
static const char * kUIViewCenterYAnchorKey;
static const char * kUIViewBaseLineAnchorKey;

@implementation UIView(HJCLayout)

- (HJCLayoutAnchor *)anchorWithClass:(Class)anchorClass key:(const void *)key layoutAttribute:(NSLayoutAttribute)layoutAttribute
{
    HJCLayoutAnchor *anchor = objc_getAssociatedObject(self, key);
    if (!anchor)
    {
        anchor = [[anchorClass alloc] init];
        anchor.layoutAttribute = layoutAttribute;
        anchor.view = self;
        objc_setAssociatedObject(self, key, anchor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return anchor;
}

- (HJCLayoutXAxisAnchor *)hjc_leadingAnchor
{
    return (HJCLayoutXAxisAnchor *)[self anchorWithClass:[HJCLayoutXAxisAnchor class] key:&kUIViewLeadingAnchorKey layoutAttribute:NSLayoutAttributeLeading];
}

- (HJCLayoutXAxisAnchor *)hjc_trailingAnchor
{
    return (HJCLayoutXAxisAnchor *)[self anchorWithClass:[HJCLayoutXAxisAnchor class] key:&kUIViewTrailingAnchorKey layoutAttribute:NSLayoutAttributeTrailing];
}

- (HJCLayoutXAxisAnchor *)hjc_leftAnchor
{
    return (HJCLayoutXAxisAnchor *)[self anchorWithClass:[HJCLayoutXAxisAnchor class] key:&kUIViewLeftAnchorKey layoutAttribute:NSLayoutAttributeLeft];
}

- (HJCLayoutXAxisAnchor *)hjc_rightAnchor
{
    return (HJCLayoutXAxisAnchor *)[self anchorWithClass:[HJCLayoutXAxisAnchor class] key:&kUIViewRightAnchorKey layoutAttribute:NSLayoutAttributeRight];
}

- (HJCLayoutYAxisAnchor *)hjc_topAnchor
{
    return (HJCLayoutYAxisAnchor *)[self anchorWithClass:[HJCLayoutYAxisAnchor class] key:&kUIViewTopAnchorKey layoutAttribute:NSLayoutAttributeTop];
}

- (HJCLayoutYAxisAnchor *)hjc_bottomAnchor
{
    return (HJCLayoutYAxisAnchor *)[self anchorWithClass:[HJCLayoutYAxisAnchor class] key:&kUIViewBottomAnchorKey layoutAttribute:NSLayoutAttributeBottom];
}

-  (HJCLayoutDimension *)hjc_widthAnchor
{
    return (HJCLayoutDimension *)[self anchorWithClass:[HJCLayoutDimension class] key:&kUIViewWidthAnchorKey layoutAttribute:NSLayoutAttributeWidth];
}

- (HJCLayoutDimension *)hjc_heightAnchor
{
    return (HJCLayoutDimension *)[self anchorWithClass:[HJCLayoutDimension class] key:&kUIViewHeightAnchorKey layoutAttribute:NSLayoutAttributeHeight];
}

- (HJCLayoutXAxisAnchor *)hjc_centerXAnchor
{
    return (HJCLayoutXAxisAnchor *)[self anchorWithClass:[HJCLayoutXAxisAnchor class] key:&kUIViewCenterXAnchorKey layoutAttribute:NSLayoutAttributeCenterX];
}

- (HJCLayoutYAxisAnchor *)hjc_centerYAnchor
{
    return (HJCLayoutYAxisAnchor *)[self anchorWithClass:[HJCLayoutYAxisAnchor class] key:&kUIViewCenterYAnchorKey layoutAttribute:NSLayoutAttributeCenterY];
}

- (HJCLayoutYAxisAnchor *)hjc_baselineAnchor
{
    return (HJCLayoutYAxisAnchor *)[self anchorWithClass:[HJCLayoutYAxisAnchor class] key:&kUIViewBaseLineAnchorKey layoutAttribute:NSLayoutAttributeBaseline];
}

@end
