//
//  MLLiveLikeViewController.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/10/30.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLLiveLikeViewController.h"

@interface MLLiveLikeViewController ()
@property (nonatomic,strong) UIButton *likeBtn;
@property (nonatomic,strong) NSMutableArray *boomCells;
@property (nonatomic,strong) CAEmitterLayer *emitterLayer;
@end

@implementation MLLiveLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.likeBtn];
}


- (UIButton *)likeBtn{
    if(!_likeBtn){
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = self.view.frame;
        _likeBtn.frame = CGRectMake(frame.size.width / 2 - 30, frame.size.height / 2 - 10, 60, 30);
        [_likeBtn setTitle:@"点赞" forState:UIControlStateNormal];
        [_likeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_likeBtn addTarget:self action:@selector(likeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}


-(void)likeAction{
    [self addCAEmitteAnimation];
}
-(void)addCAEmitteAnimation
{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.likeBtn.frame;
    emitter.lifetime = 10;
    [self.view.layer addSublayer:emitter];
    
    emitter.emitterShape = kCAEmitterLayerCircle;
    emitter.emitterMode = kCAEmitterLayerCircle;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width/2, emitter.frame.size.height/2);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"heart2"].CGImage;
    //产生粒子的个数
    cell.birthRate = 15;
    //粒子的生命周期
    cell.lifetime = 0.5;
    cell.lifetimeRange = 1;
    //粒子透明度变化
    cell.alphaSpeed = -0.4;
    //粒子速度
    cell.velocity = 100;
    cell.velocityRange = 1000;
    //粒子发射方向
    cell.emissionRange = M_PI *2.0;
    //旋转
    cell.spin = 0.1;
    cell.spin = 1;
    
    emitter.emitterCells = @[cell];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        emitter.birthRate = 0;//停止发射
    });
}

@end
