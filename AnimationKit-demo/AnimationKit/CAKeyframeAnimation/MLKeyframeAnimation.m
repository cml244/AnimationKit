//
//  MLKeyframeAnimation.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/9.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLKeyframeAnimation.h"

@implementation MLKeyframeAnimation
+(CAKeyframeAnimation *)sideLineRunAimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4;
    animation.repeatCount = CGFLOAT_MAX;
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(100, 100)],
                         [NSValue valueWithCGPoint:CGPointMake(300, 100)],
                         [NSValue valueWithCGPoint:CGPointMake(300, 400)],
                         [NSValue valueWithCGPoint:CGPointMake(100, 400)],
                         [NSValue valueWithCGPoint:CGPointMake(100, 100)]];
    animation.keyTimes = @[@(0),@(0.25),@(0.5),@(0.75),@(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    return animation;
}


+(CAKeyframeAnimation *)sideLineRunPath{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4;
    animation.repeatCount = CGFLOAT_MAX;
    
    animation.keyTimes = @[@(0),@(0.25),@(0.5),@(0.75),@(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    //绘制路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 300, 100);
    CGPathAddLineToPoint(path, NULL, 300, 400);
    CGPathAddLineToPoint(path, NULL, 100, 400);
    CGPathAddLineToPoint(path, NULL, 100, 100);
    CGPathRelease(path);
    
    animation.path = path;
    
    return animation;
}
@end
