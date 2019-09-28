//
//  MLViewAnimationViewController.m
//  AnimationKit-demo
//  https://www.iteye.com/blog/wsqwsq000-1189183
//  Created by menglin on 2019/9/28.
//  Copyright © 2019 menglin. All rights reserved.
//

#import "MLViewAnimationViewController.h"
#import "UIView+MLAnimation.h"

@interface MLViewAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation MLViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickAction:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.animationView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }];
}



@end
