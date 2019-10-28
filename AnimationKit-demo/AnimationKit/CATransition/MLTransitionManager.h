//
//  MLTransitionManager.h
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/28.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum NSUInteger{
    MLTransitionAnimationStyleNone = 0,
    MLTransitionAnimationStyleScaleOpen,//打开时进行缩放
    MLTransitionAnimationStyleScaleClose//关闭时进行缩放
}MLTransitionAnimationStyle;

@interface MLTransitionManager : NSObject

- (id<UIViewControllerAnimatedTransitioning>)animationWithStyle:(MLTransitionAnimationStyle)style;
@end

NS_ASSUME_NONNULL_END
