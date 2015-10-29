//
//  ViewController.m
//  BJVCAnimation
//
//  Created by dllo on 15/10/29.
//  Copyright © 2015年 zbj. All rights reserved.
//

#import "ViewController.h"
#import "PanTransition.h"
#import "ModelViewController.h"
#import "NormalAnimation.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate, ModelViewControllerDelegate>
@property (nonatomic, strong) PanTransition *panTransitionController;
@property (nonatomic, strong) NormalAnimation *normalAnimation;

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _normalAnimation = [NormalAnimation new];
        _panTransitionController = [PanTransition new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) buttonClicked:(id)sender
{
    ModelViewController *mvc =  [[ModelViewController alloc] init];
    mvc.transitioningDelegate = self;
    mvc.delegate = self;
    [self.panTransitionController dragToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.normalAnimation;
}


- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.panTransitionController.interacting ? self.panTransitionController : nil;
}

- (void)ModelViewControllerDidClickButton:(ModelViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
