//
//  MLMenuButton.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/1.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLMenuButton.h"
#import "UIView+MLBasicAnimation.h"
//由角度转换弧度
#define ML_DegreesToRadian(x) (M_PI * (x) / 180.0)
static CGFloat duration = 0.25;
@interface MLMenuButton()
@property (nonatomic,strong) CALayer *topLayer;
@property (nonatomic,strong) CALayer *middleLayer;
@property (nonatomic,strong) CALayer *bottomLayer;
@property (nonatomic,assign) BOOL isOpen;
@end

@implementation MLMenuButton

#pragma mark 生命周期
- (instancetype)init
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
        [self addEvent];
    }
    return self;
}

-(void)setupLayer{
    CGFloat height = 3;
    self.topLayer = [self createLayer];
    self.topLayer.frame = CGRectMake(0, 0, self.frame.size.width, height);
    [self.layer addSublayer:self.topLayer];
    
    self.middleLayer = [self createLayer];
    CGFloat middleY = (self.frame.size.height - height)/2;
    self.middleLayer.frame = CGRectMake(0, middleY, self.frame.size.width, height);
    [self.layer addSublayer:self.middleLayer];
    
    self.bottomLayer = [self createLayer];
    CGFloat bottomY = self.frame.size.height - height;
    self.bottomLayer.frame = CGRectMake(0, bottomY, self.frame.size.width, height);
    [self.layer addSublayer:self.bottomLayer];
}

-(CALayer *)createLayer{
    UIColor *color = [UIColor whiteColor];
    CGFloat cornerRadius = 3;
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = color.CGColor;
    layer.cornerRadius = cornerRadius;
    return layer;
}

#pragma mark 事件
-(void)addEvent{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:gesture];
}

-(void)clickAction{
    [self removeAnimation];
    if(self.isOpen){
        [self closeMenu];
    }else{
        [self openMenu];
    }
    
}

-(void)closeMenu{
    self.isOpen = NO;
    CABasicAnimation *topAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    topAnimation.fromValue = @(ML_DegreesToRadian(45));
    topAnimation.toValue = @(ML_DegreesToRadian(-0));
    topAnimation.duration = duration;
    topAnimation.removedOnCompletion = NO;//是否返回到初始状态
    topAnimation.repeatCount = 1;
    topAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    topAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.topLayer addAnimation:topAnimation forKey:@"topAnimation"];
    
    
    CGFloat height = self.frame.size.height;
    CABasicAnimation *topPositionAnimation =  [CABasicAnimation animationWithKeyPath:@"position"];
    topPositionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.bounds),
                                                                         roundf(CGRectGetMinY(self.bounds)))];
    topPositionAnimation.duration = duration;
    topPositionAnimation.removedOnCompletion = NO;//是否返回到初始状态
    topPositionAnimation.repeatCount = 1;
    topPositionAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    topPositionAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.topLayer addAnimation:topPositionAnimation forKey:@"topPositionAnimation"];
    
    
    CABasicAnimation *bottomAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    bottomAnimation.fromValue = @(ML_DegreesToRadian(-45));
    bottomAnimation.toValue = @(ML_DegreesToRadian(0));
    bottomAnimation.duration = duration;
    bottomAnimation.removedOnCompletion = NO;//是否返回到初始状态
    bottomAnimation.repeatCount = 1;
    bottomAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    bottomAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.bottomLayer addAnimation:bottomAnimation forKey:@"bottomAnimation"];
    
    CABasicAnimation *bottomPositionAnimation =  [CABasicAnimation animationWithKeyPath:@"position"];
    bottomPositionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.bounds),
                                                                            roundf(CGRectGetMinY(self.bounds) + height))];
    bottomPositionAnimation.duration = duration;
    bottomPositionAnimation.removedOnCompletion = NO;//是否返回到初始状态
    bottomPositionAnimation.repeatCount = 1;
    bottomPositionAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    bottomPositionAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.bottomLayer addAnimation:bottomPositionAnimation forKey:@"bottomPositionAnimation"];
    
    CABasicAnimation *middleAnimation =  [CABasicAnimation animationWithKeyPath:@"opacity"];
    middleAnimation.toValue = @(1);
    middleAnimation.duration = duration;
    middleAnimation.removedOnCompletion = NO;//是否返回到初始状态
    middleAnimation.repeatCount = 1;
    middleAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    middleAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.middleLayer addAnimation:middleAnimation forKey:@"middleAnimation"];
}

-(void)openMenu{
    self.isOpen = YES;
    CABasicAnimation *topAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    topAnimation.toValue = @(ML_DegreesToRadian(45));
    topAnimation.duration = duration;
    topAnimation.removedOnCompletion = NO;//是否返回到初始状态
    topAnimation.repeatCount = 1;
    topAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    topAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.topLayer addAnimation:topAnimation forKey:@"topAnimation"];
    
    CGFloat height = self.frame.size.height;
    CABasicAnimation *topPositionAnimation =  [CABasicAnimation animationWithKeyPath:@"position"];
    topPositionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.bounds),
                                                                 roundf(CGRectGetMinY(self.bounds)+(height/2)))];
    topPositionAnimation.duration = duration;
    topPositionAnimation.removedOnCompletion = NO;//是否返回到初始状态
    topPositionAnimation.repeatCount = 1;
    topPositionAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    topPositionAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.topLayer addAnimation:topPositionAnimation forKey:@"topPositionAnimation"];
    
    CABasicAnimation *bottomAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    bottomAnimation.toValue = @(ML_DegreesToRadian(-45));
    bottomAnimation.duration = duration;
    bottomAnimation.removedOnCompletion = NO;//是否返回到初始状态
    bottomAnimation.repeatCount = 1;
    bottomAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    bottomAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.bottomLayer addAnimation:bottomAnimation forKey:@"bottomAnimation"];
    
    CABasicAnimation *bottomPositionAnimation =  [CABasicAnimation animationWithKeyPath:@"position"];
    bottomPositionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.bounds),
                                                                         roundf(CGRectGetMinY(self.bounds)+(height/2)))];
    bottomPositionAnimation.duration = duration;
    bottomPositionAnimation.removedOnCompletion = NO;//是否返回到初始状态
    bottomPositionAnimation.repeatCount = 1;
    bottomPositionAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    bottomPositionAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.bottomLayer addAnimation:bottomPositionAnimation forKey:@"bottomPositionAnimation"];
    
    CABasicAnimation *middleAnimation =  [CABasicAnimation animationWithKeyPath:@"opacity"];
    middleAnimation.toValue = @(0);
    middleAnimation.duration = duration / 2;
    middleAnimation.removedOnCompletion = NO;//是否返回到初始状态
    middleAnimation.repeatCount = 1;
    middleAnimation.autoreverses = NO;//是否原路返回，带有动画的返回，removedOnCompletion是直接返回
    middleAnimation.fillMode = kCAFillModeForwards;//保持结束后的状态
    [self.middleLayer addAnimation:middleAnimation forKey:@"middleAnimation"];
}

-(void)removeAnimation{
    [self.topLayer removeAllAnimations];
    [self.middleLayer removeAllAnimations];
    [self.bottomLayer removeAllAnimations];
}

@end
