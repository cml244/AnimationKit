//
//  UIView+MLAnimation.h
//  AnimationKit-demo
//
//  Created by menglin on 2019/9/28.
//  Copyright © 2019 menglin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MLAnimation)

//横向平移
-(void)setWithX:(CGFloat)x
    finished:(void (^ __nullable)(void))completion;

-(void)setWithX:(CGFloat)x
    duration:(NSTimeInterval)duration
    finished:(void (^ __nullable)(void))completion;

-(void)moveWithX:(CGFloat)x
   finished:(void (^ __nullable)(void))completion;

-(void)moveWithX:(CGFloat)x
   duration:(NSTimeInterval)duration
   finished:(void (^ __nullable)(void))completion;
//纵向平移
-(void)setWithY:(CGFloat)y
       finished:(void (^ __nullable)(void))completion;

-(void)setWithY:(CGFloat)y
       duration:(NSTimeInterval)duration
       finished:(void (^ __nullable)(void))completion;

-(void)moveWithY:(CGFloat)y
        finished:(void (^ __nullable)(void))completion;

-(void)moveWithY:(CGFloat)y
        duration:(NSTimeInterval)duration
        finished:(void (^ __nullable)(void))completion;
//缩放动画
-(void)scaleWithRatio:(CGFloat)ratio
             original:(BOOL)original
             duration:(NSTimeInterval)duration
             finished:(void (^ __nullable)(void))completion;

-(void)scaleWithRatio:(CGFloat)ratio
             duration:(NSTimeInterval)duration
             finished:(void (^ __nullable)(void))completion;

-(void)scaleWithRatio:(CGFloat)ratio
             original:(BOOL)original
             finished:(void (^ __nullable)(void))completion;

-(void)scaleWithRatio:(CGFloat)ratio
             finished:(void (^ __nullable)(void))completion;

-(void)scaleFromRatio:(CGFloat)fromRatio
              toRatio:(CGFloat)toRatio
             original:(BOOL)original
             duration:(NSTimeInterval)duration
             finished:(void (^ __nullable)(void))completion;

//旋转动画
-(void)rotationWithAngle:(CGFloat)angle
                finished:(void (^ __nullable)(void))completion;

-(void)rotationWithAngle:(CGFloat)angle
                duration:(NSTimeInterval)duration
                finished:(void (^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
