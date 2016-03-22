//
//  MyPresentTransitionDelegate.m
//  CustomModalTransition
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "MyPresentTransitionDelegate.h"
#import "OverlayAnimationController.h"
#import "OverlayPresentationController.h"

@implementation MyPresentTransitionDelegate

// 转场动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [OverlayAnimationController new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [OverlayAnimationController new];
}

// 转场监听(转场前/后...)
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[OverlayPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}
/*
 - (void)presentationTransitionWillBegin;
 - (void)presentationTransitionDidEnd:(BOOL)completed;
 - (void)dismissalTransitionWillBegin;
 - (void)dismissalTransitionDidEnd:(BOOL)completed;
 ...
 */

@end
