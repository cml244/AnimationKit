//
//  MLWaterView.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/15.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLWaterView.h"
#define ML_RGB_COLOR(r,g,b,d) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(d)]
@interface MLWaterView()
@end

@implementation MLWaterView

#pragma mark 视图初始化
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initView];
    }
    return self;
}

-(void)initView{
    [self addLayer];
    [self addCircle];
}

-(void)addCircle{
    UIView *circleView = [[UIView alloc]initWithFrame:self.bounds];
    circleView.layer.masksToBounds = YES;
    circleView.layer.cornerRadius = self.frame.size.width / 2;
    circleView.backgroundColor = [UIColor whiteColor];
    [self addSubview:circleView];
}

-(void)addLayer{
    CALayer *animationLayer = [CALayer layer];
    for(int i = 0;i < 3;i++){
        CALayer *layer = [CALayer layer];
        layer.frame = self.bounds;
        CAAnimationGroup *groupAnimation = [self groupAnimationWithIndex:i];
        [layer addAnimation:groupAnimation forKey:@"WaterAimation"];
        layer.cornerRadius = self.frame.size.height / 2;
        [animationLayer addSublayer:layer];
    }
    [self.layer addSublayer:animationLayer];
}


#pragma mark 动画
-(CAAnimationGroup *)groupAnimationWithIndex:(NSInteger)index{
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    NSMutableArray *animations = [[NSMutableArray alloc]init];
    [animations addObject:[self scaleAnimation]];
    [animations addObject:[self borderAnimation]];
    [animations addObject:[self bgColorAnimation]];
    groupAnimation.beginTime = CACurrentMediaTime() + index * 1;
    groupAnimation.duration = 3;
    groupAnimation.repeatCount = INT_MAX;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.animations = animations;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    return groupAnimation;
}

-(CABasicAnimation *)scaleAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(1);
    animation.toValue = @(1.75);
    return animation;
}

-(CAKeyframeAnimation *)borderAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    animation.values = @[(__bridge id)ML_RGB_COLOR(79, 215, 182, 0.45).CGColor,
                        (__bridge id)ML_RGB_COLOR(79, 215, 182, 0.25).CGColor,
                        (__bridge id)ML_RGB_COLOR(79, 215, 182, 0.15).CGColor,
                        (__bridge id)ML_RGB_COLOR(79, 215, 182, 0).CGColor];
    animation.keyTimes = @[@0.4,@0.5,@0.8,@1];
    return animation;
}

-(CAKeyframeAnimation *)bgColorAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    animation.values = @[(__bridge id)ML_RGB_COLOR(79, 215, 182, 0.45).CGColor,
                         (__bridge id)ML_RGB_COLOR(79, 215, 182, 0.25).CGColor,
                         (__bridge id)ML_RGB_COLOR(79, 215, 182, 0.15).CGColor,
                         (__bridge id)ML_RGB_COLOR(79, 215, 182, 0).CGColor];
    animation.keyTimes = @[@0.4,@0.5,@0.8,@1];
    return animation;
}
@end
