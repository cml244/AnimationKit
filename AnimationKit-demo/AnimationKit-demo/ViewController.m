//
//  ViewController.m
//  AnimationKit-demo
//
//  Created by menglin on 2019/9/25.
//  Copyright © 2019 menglin. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+MLTransitioning.h"
#import "MLTransitionManager.h"
#import "MLLiveLikeViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *data;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[
                  @{@"name":@"UIViewAnimation",@"vc":@"MLViewAnimationViewController"},
                  @{@"name":@"CABasicAnimation",@"vc":@"MLViewAnimationViewController"},
                  @{@"name":@"CAAnimationGroup",@"vc":@"MLViewAnimationViewController"},
                  @{@"name":@"CAKeyframeAnimation",@"vc":@"MLViewAnimationViewController"},
                  @{@"name":@"CATransition",@"vc":@"MLViewAnimationViewController"},
                  @{@"name":@"CAEmitterLayer",@"vc":@"MLLiveLikeViewController"},
                  @{@"name":@"CADisplayLink",@"vc":@"MLViewAnimationViewController"},
                  @{@"name":@"DynamicAnimator",@"vc":@"MLDynamicAnimatorViewController"}];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

-(void)initView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellID"];
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    }
    return _tableView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID" forIndexPath:indexPath];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellID"];
    }
    cell.textLabel.text = self.data[indexPath.row][@"name"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *vcName = self.data[indexPath.row][@"vc"];
    UIViewController * vc = nil;
    if(indexPath.row == 5){
        vc = [[NSClassFromString(vcName) alloc]  init];
    }else{
        vc = [[NSClassFromString(vcName) alloc]  initWithNibName:vcName bundle:nil];
    }
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    navi.modalPresentationStyle = UIModalPresentationFullScreen;
    [self ml_presentViewController:navi animationStyle:MLTransitionAnimationStyleScaleOpen animated:YES completion:nil];

}


@end
