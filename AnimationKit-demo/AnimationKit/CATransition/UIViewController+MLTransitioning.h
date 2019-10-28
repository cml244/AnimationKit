//
//  UIViewController+MLTransitioning.h
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/16.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLTransitionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MLTransitioning)
@property (nonatomic,assign) MLTransitionAnimationStyle animationStyle;
- (void)ml_presentViewController:(UIViewController *)viewController
                  animationStyle:(MLTransitionAnimationStyle)animationStyle
                        animated: (BOOL)flag
                      completion:(void (^ __nullable)(void))completion;
- (void)ml_dismissViewControllerAnimated:(BOOL)nimated
                          animationStyle:(MLTransitionAnimationStyle)animationStyle
                              completion:(void (^ __nullable)(void))completion;
@end

@interface UINavigationController (MLTransitioning)

- (void)ml_pushViewController:(UIViewController *)viewController
               animationStyle:(MLTransitionAnimationStyle)animationStyle
                     animated:(BOOL)animated;
@end
NS_ASSUME_NONNULL_END
