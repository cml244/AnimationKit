//
//  UIView+AnimationGroup.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/6.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "UIView+AnimationGroup.h"
static NSTimeInterval ML_ANIMATION_DURATION = 0.3;//默认时间0.3秒

@implementation UIView (AnimationGroup)
-(void)addAnimation:(CAAnimation*) animations, ... NS_REQUIRES_NIL_TERMINATION{
    va_list arg_list;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    if(animations){
        [array addObject:animations];
        va_start(arg_list, animations);
        CAAnimation *animation = va_arg(arg_list, CAAnimation *);
        while(animation){
            [array addObject:animation];
            animation = va_arg(arg_list, CAAnimation *);
        }
        va_end(arg_list);
        CAAnimationGroup *groupAnimation =  [CAAnimationGroup animation];
        groupAnimation.animations = array;
        groupAnimation.duration = ML_ANIMATION_DURATION;
        [self.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    }
}

@end
