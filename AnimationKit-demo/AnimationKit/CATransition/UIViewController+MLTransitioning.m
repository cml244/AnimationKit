//
//  UIViewController+MLTransitioning.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/16.
//  Copyright © 2019 caomenglin. All rights reserved.
//

static char * const kTransitionAnimationStyleKey = "kTransitionAnimationStyleKey";

#import "UIViewController+MLTransitioning.h"
#import "MLNavigationAnimationDelegate.h"
#import <objc/runtime.h>


@implementation UIViewController (MLTransitioning)
- (void)ml_presentViewController:(UIViewController *)viewController
animationStyle:(MLTransitionAnimationStyle)animationStyle
      animated: (BOOL)flag
    completion:(void (^ __nullable)(void))completion{
    MLNavigationAnimationDelegate *delegate = [[MLNavigationAnimationDelegate alloc]init];
    viewController.transitioningDelegate = delegate;
    viewController.animationStyle = animationStyle;
    [self presentViewController:viewController animated:flag completion:completion];
}

- (void)ml_dismissViewControllerAnimated:(BOOL)nimated
                       animationStyle:(MLTransitionAnimationStyle)animationStyle
                           completion:(void (^ __nullable)(void))completion{
    MLNavigationAnimationDelegate *delegate = [[MLNavigationAnimationDelegate alloc]init];
    self.transitioningDelegate = delegate;
    self.animationStyle = animationStyle;
    [self dismissViewControllerAnimated:nimated completion:nil];
}

- (void)setAnimationStyle:(MLTransitionAnimationStyle)animationStyle{
    objc_setAssociatedObject(self, kTransitionAnimationStyleKey, @(animationStyle), OBJC_ASSOCIATION_ASSIGN);
}
- (MLTransitionAnimationStyle)animationStyle{
    return [objc_getAssociatedObject(self, kTransitionAnimationStyleKey) intValue];
}
@end


@implementation UINavigationController (MLTransitioning)

- (void)ml_pushViewController:(UIViewController *)viewController
animationStyle:(MLTransitionAnimationStyle)animationStyle
      animated:(BOOL)animated{
    MLNavigationAnimationDelegate *delegate = [[MLNavigationAnimationDelegate alloc]init];
    self.delegate = delegate;
    self.animationStyle = animationStyle;
    [self pushViewController:viewController animated:YES];
}
@end
