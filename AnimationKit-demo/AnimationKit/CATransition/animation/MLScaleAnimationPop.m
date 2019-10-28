//
//  MLScaleAnimationPop.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/28.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLScaleAnimationPop.h"

@implementation MLScaleAnimationPop
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView* toView = nil;
    UIView* fromView = nil;
    UIView* transView = nil;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    
    transView = fromView;
    //添加截图，防止出现空白页
    UIView *snapShot = [toView snapshotViewAfterScreenUpdates:YES];
    [[transitionContext containerView] addSubview:snapShot];
    [[transitionContext containerView] addSubview:fromView];
    
     transView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
         transView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
@end
