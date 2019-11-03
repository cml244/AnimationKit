//
//  MLDynamicAnimatorViewController.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/11/2.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLDynamicAnimatorViewController.h"

@interface MLDynamicAnimatorViewController ()<UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (nonatomic,strong) UIDynamicAnimator *animator;

@end

@implementation MLDynamicAnimatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//重力行为
- (IBAction)animationAction:(UIButton *)sender {
    // 1.创建一个动画管理者，使用self.view作为参照物
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //TODO 这里一定要将animator设置成强引用，如果不使用property，直接用[animator addBehavior:gravityBehavior];将无法执行动画
    _animator = animator;
    // 2.创建动力学行为,并添加需要执行动画的视图
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.animationView]];
    // 设置向下的方向
    gravityBehavior.angle = M_PI / 2;
    // 设置加速度
    gravityBehavior.magnitude = 20;
    // 3.将动力学行为添加到动画者
    [_animator addBehavior:gravityBehavior];
}

//吸附行为
- (IBAction)attachmenAction:(id)sender {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc]initWithItem:self.animationView attachedToAnchor:CGPointMake(100, 500)];
    attachmentBehavior.length = 10;
    attachmentBehavior.frequency = 1;
    attachmentBehavior.damping = 0.5;
    [self.animator addBehavior:attachmentBehavior];
    
}
//碰撞
- (IBAction)collisionAction:(id)sender {
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc]initWithItems:@[self.animationView]];
    [collisionBehavior addBoundaryWithIdentifier:@"point" fromPoint:self.animationView.center toPoint:CGPointMake(100, 500)];
    [self.animator addBehavior:collisionBehavior];
}

- (void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator{
    NSLog(@"开始运动");
}
- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator{
    NSLog(@"结束运动");
}

@end
