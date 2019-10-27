//
//  UIViewController+MLTransitioning.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/16.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "UIViewController+MLTransitioning.h"
#import "MLNavigationAnimationDelegate.h"


@implementation UIViewController (MLTransitioning)

@end


@implementation UINavigationController (MLTransitioning)

- (void)ml_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    MLNavigationAnimationDelegate *delegate = [[MLNavigationAnimationDelegate alloc]init];
    delegate.navigation = self;
    delegate.delegate = self.delegate;
}
@end
