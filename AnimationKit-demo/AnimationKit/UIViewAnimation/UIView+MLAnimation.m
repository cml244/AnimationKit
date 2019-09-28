//
//  UIView+MLAnimation.m
//  AnimationKit-demo
//
//  Created by menglin on 2019/9/28.
//  Copyright © 2019 menglin. All rights reserved.
//

#import "UIView+MLAnimation.h"
static NSTimeInterval ML_ANIMATION_DURATION = 0.3;//默认时间0.3秒
//由角度转换弧度
#define ML_DegreesToRadian(x) (M_PI * (x) / 180.0)
//由弧度转换角度
#define ML_RadianToDegrees(radian) (radian*180.0)/(M_PI)

@implementation UIView (MLAnimation)
#pragma mark 横向平移

/**
 将x坐标设置成指定的点
 @param x 新的坐标
 @param completion 结束后回调
 */
-(void)setWithX:(CGFloat)x
   finished:(void (^ __nullable)(void))completion{
    [self setWithX:x duration:ML_ANIMATION_DURATION finished:completion];
}

/**
 将x坐标设置成指定的点

 @param x 新的坐标
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)setWithX:(CGFloat)x
   duration:(NSTimeInterval)duration
   finished:(void (^ __nullable)(void))completion{
    [UIView animateWithDuration:duration animations:^{
        CGRect _frame = self.frame;
        _frame.origin.x = x;
        self.frame = _frame;
    } completion:^(BOOL finished) {
        if(completion){
            completion();
        }
    }];
}

-(void)moveWithX:(CGFloat)x
    finished:(void (^ __nullable)(void))completion{
    [self moveWithX:x duration:ML_ANIMATION_DURATION finished:completion];
}


/**
 在原有的坐标上向右移动x个像素
 @param x 像素值
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)moveWithX:(CGFloat)x
    duration:(NSTimeInterval)duration
    finished:(void (^ __nullable)(void))completion{
    [UIView animateWithDuration:duration animations:^{
        CGRect _frame = self.frame;
        _frame.origin.x += x;
        self.frame = _frame;
    } completion:^(BOOL finished) {
        if(completion){
            completion();
        }
    }];
}

#pragma mark 纵向平移
/**
 将y坐标设置成指定的点
 @param y 新的坐标
 @param completion 结束后回调
 */
-(void)setWithY:(CGFloat)y
       finished:(void (^ __nullable)(void))completion{
    [self setWithY:y duration:ML_ANIMATION_DURATION finished:completion];
}

/**
 将y坐标设置成指定的点
 
 @param y 新的坐标
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)setWithY:(CGFloat)y
       duration:(NSTimeInterval)duration
       finished:(void (^ __nullable)(void))completion{
    [UIView animateWithDuration:duration animations:^{
        CGRect _frame = self.frame;
        _frame.origin.y = y;
        self.frame = _frame;
    } completion:^(BOOL finished) {
        if(completion){
            completion();
        }
    }];
}

-(void)moveWithY:(CGFloat)y
        finished:(void (^ __nullable)(void))completion{
    [self moveWithY:y duration:ML_ANIMATION_DURATION finished:completion];
}


/**
 在原有的坐标上向右移动y个像素
 @param y 像素值
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)moveWithY:(CGFloat)y
        duration:(NSTimeInterval)duration
        finished:(void (^ __nullable)(void))completion{
    [UIView animateWithDuration:duration animations:^{
        CGRect _frame = self.frame;
        _frame.origin.y += y;
        self.frame = _frame;
    } completion:^(BOOL finished) {
        if(completion){
            completion();
        }
    }];
}

#pragma mark 缩放动画

/**
 缩放动画
 
 @param ratio 缩放到指定大小
 @param completion 结束后回调
 */
-(void)scaleWithRatio:(CGFloat)ratio
             finished:(void (^ __nullable)(void))completion{
    [self scaleWithRatio:ratio original:NO duration:ML_ANIMATION_DURATION finished:completion];
}
/**
 缩放动画
 
 @param ratio 缩放到指定大小
 @param original 结束后是否还原
 @param completion 结束后回调
 */
-(void)scaleWithRatio:(CGFloat)ratio
             original:(BOOL)original
             finished:(void (^ __nullable)(void))completion{
    [self scaleWithRatio:ratio original:original duration:ML_ANIMATION_DURATION finished:completion];
}

/**
 缩放动画
 
 @param ratio 缩放到指定大小
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)scaleWithRatio:(CGFloat)ratio
             duration:(NSTimeInterval)duration
             finished:(void (^ __nullable)(void))completion{
    [self scaleWithRatio:ratio original:NO duration:duration finished:completion];
}


/**
 缩放动画

 @param ratio 缩放到指定大小
 @param original 结束后是否还原
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)scaleWithRatio:(CGFloat)ratio
             original:(BOOL)original
             duration:(NSTimeInterval)duration
             finished:(void (^ __nullable)(void))completion{
    [UIView animateWithDuration:duration animations:^{
        //缩放原来的多少倍
        self.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        
        if(original){
            [UIView animateWithDuration:duration animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                if(completion){
                    completion();
                }
            }];
        }else{
            if(completion){
                completion();
            }
        }
    }];
}


/**
 缩放动画
 
 @param fromRatio 缩小前的比例
 @param toRatio 放大后的比例
 @param original 结束后是否还原
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)scaleFromRatio:(CGFloat)fromRatio
              toRatio:(CGFloat)toRatio
             original:(BOOL)original
             duration:(NSTimeInterval)duration
             finished:(void (^ __nullable)(void))completion{
    self.transform = CGAffineTransformMakeScale(fromRatio, fromRatio);
    [self scaleWithRatio:toRatio original:original duration:duration finished:completion];
    
}

#pragma mark 旋转动画
/**
 旋转动画
 
 @param angle 旋转角度
 @param completion 结束后回调
 */
-(void)rotationWithAngle:(CGFloat)angle
                finished:(void (^ __nullable)(void))completion{
    [self rotationWithAngle:angle duration:ML_ANIMATION_DURATION finished:completion];
}


/**
 旋转动画

 @param angle 旋转角度
 @param duration 动画持续时间
 @param completion 结束后回调
 */
-(void)rotationWithAngle:(CGFloat)angle
                duration:(NSTimeInterval)duration
                finished:(void (^ __nullable)(void))completion{
    [UIView animateWithDuration:duration animations:^{
        CGAffineTransform rotationTransform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformRotate(rotationTransform, ML_DegreesToRadian(angle));
    } completion:^(BOOL finished) {
        if(completion){
            completion();
        }
    }];
}

@end
