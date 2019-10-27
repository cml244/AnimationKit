//
//  MLNavigationAnimationDelegate.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/16.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLNavigationAnimationDelegate.h"

@implementation MLNavigationAnimationDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
             fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    
    return nil;
}
@end
