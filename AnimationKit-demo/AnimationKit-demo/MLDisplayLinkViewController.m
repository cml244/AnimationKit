//
//  MLDisplayLinkViewController.m
//  AnimationKit-demo
//
//  Created by caomenglin on 2019/11/3.
//  Copyright © 2019 caomenglin. All rights reserved.
//

#import "MLDisplayLinkViewController.h"


@interface MLDisplayLinkViewController ()
@property (nonatomic,strong) CADisplayLink *displayLink;
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (nonatomic,strong) CAShapeLayer *progressLayer;
@property (nonatomic,strong) UIBezierPath *progressPath;
@property (nonatomic,assign) CGFloat startAngle;
@end

@implementation MLDisplayLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTimer];
    [self addLayer];
}

#pragma mark 定时器
-(void)initTimer{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTimer)];
    //每秒执行一次
    self.displayLink.preferredFramesPerSecond = 10;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)updateTimer{
    if(self.startAngle >= 360){
        self.displayLink.paused = YES;
    }
    CGPoint point = CGPointMake(self.animationView.frame.size.width/2, self.animationView.frame.size.height/2);
    [self.progressPath addArcWithCenter:point radius:80  startAngle:(M_PI /180.0) *_startAngle endAngle:(M_PI /180.0) *(_startAngle + 3.6) clockwise:YES];
    self.progressLayer.path = self.progressPath.CGPath;
    self.startAngle += 3.6;
}

#pragma mark 添加图层
-(void)addLayer{
    [self addBgLayer];
    [self addProgressLayer];
}

-(void)addBgLayer{
    CGPoint point = CGPointMake(self.animationView.frame.size.width/2, self.animationView.frame.size.height/2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:80 startAngle:0 endAngle:360 clockwise:YES];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 5;
    layer.strokeColor = [UIColor grayColor].CGColor;
    layer.fillColor = nil;
    layer.path = path.CGPath;
    [self.animationView.layer addSublayer:layer];
}

-(void)addProgressLayer{
    CGPoint point = CGPointMake(self.animationView.frame.size.width/2, self.animationView.frame.size.height/2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:80 startAngle:0 endAngle:0 clockwise:YES];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 5;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = nil;
    [self.animationView.layer addSublayer:layer];
    self.progressLayer = layer;
    self.progressPath = path;
}
@end
