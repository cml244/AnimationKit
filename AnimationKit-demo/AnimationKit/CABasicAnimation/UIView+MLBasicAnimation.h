//
//  UIView+MLBasicAnimation.h
//  AnimationKit-demo
//  
//  Created by caomenglin on 2019/9/29.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MLBasicAnimation)
-(CABasicAnimation *)moveWithX_ML:(CGFloat)x;

-(CABasicAnimation *)moveWithX_ML:(CGFloat)x
           duration:(NSTimeInterval)duration;

-(CABasicAnimation *)moveWithY_ML:(CGFloat)y;

-(CABasicAnimation *)moveWithY_ML:(CGFloat)y
           duration:(NSTimeInterval)duration;
//缩放动画
-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio
                original:(BOOL)original
                duration:(NSTimeInterval)duration;

-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio
                duration:(NSTimeInterval)duration;

-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio
                original:(BOOL)original;

-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio;

-(CABasicAnimation *)scaleFromRatio_ML:(CGFloat)fromRatio
                 toRatio:(CGFloat)toRatio
                original:(BOOL)original
                duration:(NSTimeInterval)duration;

//旋转动画
-(CABasicAnimation *)rotationWithAngle_ML:(CGFloat)angle;

-(CABasicAnimation *)rotationWithAngle_ML:(CGFloat)angle
                   duration:(NSTimeInterval)duration;
@end

NS_ASSUME_NONNULL_END
