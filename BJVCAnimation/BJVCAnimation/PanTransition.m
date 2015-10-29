//
//  PanTransition.m
//  BJVCAnimation
//
//  Created by dllo on 15/10/29.
//  Copyright © 2015年 zbj. All rights reserved.
//

#import "PanTransition.h"

@interface PanTransition ()

@property (nonatomic, assign) BOOL isComplete;
@property (nonatomic, strong) UIViewController *presentVC;

@end

@implementation PanTransition

- (void)dragToViewController:(UIViewController *)viewController
{
    self.presentVC = viewController;
    [self gestureRecognizerInView:viewController.view];
}

- (void)gestureRecognizerInView:(UIView *)view
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

- (CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            
            self.interacting = YES;
            [self.presentVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. 计算百分比
            CGFloat fraction = translation.y / 400.0;
            //范围从0到1
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.isComplete = (fraction > 0.5);
            
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. 状态结束
            self.interacting = NO;
            if (!self.isComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}



@end
