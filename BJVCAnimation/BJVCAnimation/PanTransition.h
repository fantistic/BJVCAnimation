//
//  PanTransition.h
//  BJVCAnimation
//
//  Created by dllo on 15/10/29.
//  Copyright © 2015年 zbj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;
- (void)dragToViewController:(UIViewController *)viewController;

@end
