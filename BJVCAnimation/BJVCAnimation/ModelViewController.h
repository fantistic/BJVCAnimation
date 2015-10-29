//
//  ModelViewController.h
//  BJVCAnimation
//
//  Created by dllo on 15/10/29.
//  Copyright © 2015年 zbj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelViewController;
@protocol ModelViewControllerDelegate <NSObject>

- (void)ModelViewControllerDidClickButton:(ModelViewController *)viewController;

@end

@interface ModelViewController : UIViewController

@property (nonatomic, weak) id<ModelViewControllerDelegate>delegate;

@end
