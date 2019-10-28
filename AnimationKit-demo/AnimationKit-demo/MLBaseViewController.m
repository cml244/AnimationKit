//
//  MLBaseViewController.m
//  AnimationKit-demo
//
//  Created by menglin on 2019/9/28.
//  Copyright © 2019 menglin. All rights reserved.
//

#import "MLBaseViewController.h"
#import "UIViewController+MLTransitioning.h"

@interface MLBaseViewController ()

@end

@implementation MLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if(self.navigationController.viewControllers.count == 1){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 80, 40);
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    }
    
}

- (void)cancelAction{
    [self.navigationController ml_dismissViewControllerAnimated:YES animationStyle:MLTransitionAnimationStyleScaleClose completion:nil];
}

@end
