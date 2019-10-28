//
//  MLNavigationAnimationDelegate.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/16.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLNavigationAnimationDelegate.h"
#import "MLTransitionManager.h"
#import "UIViewController+MLTransitioning.h"

@implementation MLNavigationAnimationDelegate

#pragma mark UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
             fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    MLTransitionManager *manager = [[MLTransitionManager alloc]init];
    return [manager animationWithStyle:navigationController.animationStyle];
}

#pragma mark UIViewControllerTransitioningDelegate
//指定present动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    MLTransitionManager *manager = [[MLTransitionManager alloc]init];
    return [manager animationWithStyle:presented.animationStyle];
}

//指定dismiss动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    MLTransitionManager *manager = [[MLTransitionManager alloc]init];
    return [manager animationWithStyle:dismissed.animationStyle];
}

@end
