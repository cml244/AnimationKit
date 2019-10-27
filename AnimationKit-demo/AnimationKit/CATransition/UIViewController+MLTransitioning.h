//
//  UIViewController+MLTransitioning.h
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/16.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MLTransitioning)

@end

@interface UINavigationController (MLTransitioning)

- (void)ml_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end
NS_ASSUME_NONNULL_END
