//
//  HJCLayoutAnchor.h
//  HJCLayout
//
//  Created by hjcool7 on 16/2/17.
//  Copyright © 2016年 hjcool7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HJCLayoutAnchor<AnchorType> : NSObject

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutAnchor<AnchorType> *)anchor;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutAnchor<AnchorType> *)anchor;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutAnchor<AnchorType> *)anchor;

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutAnchor<AnchorType> *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutAnchor<AnchorType> *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutAnchor<AnchorType> *)anchor constant:(CGFloat)c;

@end

@class HJCLayoutXAxisAnchor, HJCLayoutYAxisAnchor;

@interface HJCLayoutXAxisAnchor : HJCLayoutAnchor<HJCLayoutXAxisAnchor *>
@end

@interface HJCLayoutYAxisAnchor : HJCLayoutAnchor<HJCLayoutYAxisAnchor *>
@end


@class HJCLayoutDimension;

@interface HJCLayoutDimension : HJCLayoutAnchor<HJCLayoutDimension *>

- (NSLayoutConstraint *)constraintEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToConstant:(CGFloat)c;

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m;

- (NSLayoutConstraint *)constraintEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(HJCLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
@end

@interface NSLayoutConstraint(HJCLayout)

@property (nonatomic) BOOL hjc_active;

@end

@interface UIView(HJCLayout)

@property(readonly, strong) HJCLayoutXAxisAnchor *hjc_leadingAnchor;
@property(readonly, strong) HJCLayoutXAxisAnchor *hjc_trailingAnchor;
@property(readonly, strong) HJCLayoutXAxisAnchor *hjc_leftAnchor;
@property(readonly, strong) HJCLayoutXAxisAnchor *hjc_rightAnchor;
@property(readonly, strong) HJCLayoutYAxisAnchor *hjc_topAnchor;
@property(readonly, strong) HJCLayoutYAxisAnchor *hjc_bottomAnchor;
@property(readonly, strong) HJCLayoutDimension *hjc_widthAnchor;
@property(readonly, strong) HJCLayoutDimension *hjc_heightAnchor;
@property(readonly, strong) HJCLayoutXAxisAnchor *hjc_centerXAnchor;
@property(readonly, strong) HJCLayoutYAxisAnchor *hjc_centerYAnchor;
@property(readonly, strong) HJCLayoutYAxisAnchor *hjc_baselineAnchor;

@end