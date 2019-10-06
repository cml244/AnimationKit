//
//  UIView+MLBasicAnimation.m
//  AnimationKit-demo
//
//  https://www.jianshu.com/p/71c880498d7a
//  https://www.jianshu.com/p/83f7e4e3ceb0
//  Created by caomenglin on 2019/9/29.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "UIView+MLBasicAnimation.h"
static NSTimeInterval ML_ANIMATION_DURATION = 0.3;//默认时间0.3秒
//由角度转换弧度
#define ML_DegreesToRadian(x) (M_PI * (x) / 180.0)
//由弧度转换角度
#define ML_RadianToDegrees(radian) (radian*180.0)/(M_PI)


@implementation UIView (MLBasicAnimation)
#pragma mark 横向平移

-(CABasicAnimation *)moveWithX_ML:(CGFloat)x{
    return [self moveWithX_ML:x duration:ML_ANIMATION_DURATION];
}


/**
 在原有的坐标上向右移动x个像素
 @param x 像素值
 @param duration 动画持续时间
 */
-(CABasicAnimation *)moveWithX_ML:(CGFloat)x
           duration:(NSTimeInterval)duration{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.toValue = @(x);
    animation.duration = duration;
    animation.removedOnCompletion = NO;//是否返回到初始状态
//    animation.repeatCount = MAXFLOAT;//动画执行的次数
    animation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    animation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.layer addAnimation:animation forKey:@"moveWithX_ML"];
    return animation;
}

#pragma mark 纵向平移

-(CABasicAnimation *)moveWithY_ML:(CGFloat)y{
    return [self moveWithY_ML:y duration:ML_ANIMATION_DURATION];
}


/**
 在原有的坐标上向右移动y个像素
 @param y 像素值
 @param duration 动画持续时间
 */
-(CABasicAnimation *)moveWithY_ML:(CGFloat)y
           duration:(NSTimeInterval)duration{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.toValue = @(y);
    animation.duration = duration;
    animation.removedOnCompletion = NO;//是否返回到初始状态
    //    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    animation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.layer addAnimation:animation forKey:@"moveWithY_ML"];
    return animation;
}

#pragma mark 缩放动画

/**
 缩放动画
 
 @param ratio 缩放到指定大小
 */
-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio{
    return [self scaleWithRatio_ML:ratio original:NO duration:ML_ANIMATION_DURATION];
}
/**
 缩放动画
 
 @param ratio 缩放到指定大小
 @param original 结束后是否还原
 */
-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio
                original:(BOOL)original{
    return [self scaleWithRatio_ML:ratio original:original duration:ML_ANIMATION_DURATION];
}

/**
 缩放动画
 
 @param ratio 缩放到指定大小
 @param duration 动画持续时间
 */
-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio
                duration:(NSTimeInterval)duration{
    return [self scaleWithRatio_ML:ratio original:NO duration:duration];
}


/**
 缩放动画
 
 @param ratio 缩放到指定大小
 @param original 结束后是否还原
 @param duration 动画持续时间
 */
-(CABasicAnimation *)scaleWithRatio_ML:(CGFloat)ratio
                original:(BOOL)original
                duration:(NSTimeInterval)duration{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = @(ratio);
    animation.duration = duration;
    animation.removedOnCompletion = original;//是否返回到初始状态
    //    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = original;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    animation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.layer addAnimation:animation forKey:@"scaleWithRatio_ML"];
    return animation;
}


/**
 缩放动画
 
 @param fromRatio 缩小前的比例
 @param toRatio 放大后的比例
 @param original 结束后是否还原
 @param duration 动画持续时间
 */
-(CABasicAnimation *)scaleFromRatio_ML:(CGFloat)fromRatio
                 toRatio:(CGFloat)toRatio
                original:(BOOL)original
                duration:(NSTimeInterval)duration{
    self.transform = CGAffineTransformMakeScale(fromRatio, fromRatio);
    return [self scaleWithRatio_ML:toRatio original:original duration:duration];
    
}

#pragma mark 旋转动画
/**
 旋转动画
 
 @param angle 旋转角度
 */
-(CABasicAnimation *)rotationWithAngle_ML:(CGFloat)angle{
    return [self rotationWithAngle_ML:angle duration:ML_ANIMATION_DURATION];
}


/**
 旋转动画
 
 @param angle 旋转角度
 @param duration 动画持续时间
 */
-(CABasicAnimation *)rotationWithAngle_ML:(CGFloat)angle
                   duration:(NSTimeInterval)duration{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.toValue = @(ML_DegreesToRadian(angle));
    animation.duration = duration;
    animation.removedOnCompletion = NO;//是否返回到初始状态
    animation.repeatCount = 1;
    animation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    animation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.layer addAnimation:animation forKey:@"rotationWithAngle_ML"];
    return animation;
}
@end
