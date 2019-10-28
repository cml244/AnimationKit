//
//  MLTransitionManager.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/28.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLTransitionManager.h"
#import "MLScaleAnimationPush.h"
#import "MLScaleAnimationPop.h"

@implementation MLTransitionManager

- (id<UIViewControllerAnimatedTransitioning>)animationWithStyle:(MLTransitionAnimationStyle)style{
    id<UIViewControllerAnimatedTransitioning> animation = nil;
    switch (style) {
        case MLTransitionAnimationStyleScaleOpen:
            return [MLScaleAnimationPush new];
            break;
        case MLTransitionAnimationStyleScaleClose:
            return [MLScaleAnimationPop new];
            break;
        default:
            break;
    }
    return animation;
}
@end
