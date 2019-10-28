//
//  MLViewAnimationViewController.m
//  AnimationKit-demo
//  https://www.iteye.com/blog/wsqwsq000-1189183
//  Created by menglin on 2019/9/28.
//  Copyright © 2019 menglin. All rights reserved.
//

#import "MLViewAnimationViewController.h"
#import "UIView+MLBasicAnimation.h"
#import "UIView+AnimationGroup.h"
#import "MLMenuButton.h"
#import "MLKeyframeAnimation.h"
#import "MLWaterView.h"
#import "MLTransitionManager.h"
#import "UIViewController+MLTransitioning.h"

@interface MLViewAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (nonatomic,strong) MLWaterView *menuButton;

@end

@implementation MLViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addWaterButtonView];
    
}
- (IBAction)clickAction:(UIButton *)sender {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    transition.duration = 1;
    transition.startProgress = 0.5;
    transition.endProgress = 0.8;
    [self.animationView.layer addAnimation:transition forKey:nil];
    
    MLViewAnimationViewController *vc = [MLViewAnimationViewController new];
    [self.navigationController ml_pushViewController:vc animationStyle:MLTransitionAnimationStyleScaleOpen animated:YES];
}


-(void)addWaterButtonView{
    MLWaterView *waterButton = [[MLWaterView alloc]initWithFrame:CGRectMake(100, 450, 100, 100)];
    [self.view addSubview:waterButton];
}


@end
