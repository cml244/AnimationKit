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

@interface MLViewAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (nonatomic,strong) MLMenuButton *menuButton;

@end

@implementation MLViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addWaterButtonView];
    
}
- (IBAction)clickAction:(UIButton *)sender {
    CABasicAnimation *transformX = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    transformX.toValue = @(100);
    transformX.removedOnCompletion = NO;//是否返回到初始状态
    transformX.fillMode = kCAFillModeForwards;//保持结束后的状态
    
    CABasicAnimation *transformScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    transformScale.toValue = @(1.3);
    transformScale.removedOnCompletion = NO;//是否返回到初始状态
    transformScale.fillMode = kCAFillModeForwards;//保持结束后的状态
//    [self.animationView addAnimation:transformX,transformScale,nil];
    CAKeyframeAnimation *animation = [MLKeyframeAnimation sideLineRunPath];
    [self.animationView.layer addAnimation:animation forKey:@"test"];
}


-(void)addWaterButtonView{
    MLWaterView *waterButton = [[MLWaterView alloc]initWithFrame:CGRectMake(100, 450, 100, 100)];
//    waterButton.clipsToBounds = YES;
//    waterButton.layer.cornerRadius = 50;
    [self.view addSubview:waterButton];
}


@end
