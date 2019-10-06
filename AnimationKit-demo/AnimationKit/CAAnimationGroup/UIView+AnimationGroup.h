//
//  UIView+AnimationGroup.h
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/6.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AnimationGroup)
-(void)addAnimation:(CAAnimation*) animations, ... NS_REQUIRES_NIL_TERMINATION;
@end

NS_ASSUME_NONNULL_END
