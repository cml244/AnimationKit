//
//  MLNavigationAnimationDelegate.h
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/16.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLNavigationAnimationDelegate : NSObject<UINavigationControllerDelegate>
@property (nonatomic, weak) UINavigationController *navigation;
@property (nonatomic, weak) id <UINavigationControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
