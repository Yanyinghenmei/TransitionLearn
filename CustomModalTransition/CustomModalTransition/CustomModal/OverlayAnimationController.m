//
//  OverlayAnimationController.m
//  CustomModalTransition
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "OverlayAnimationController.h"

@implementation OverlayAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (![transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]||
        ![transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]) {
        return;
    }
    
    if (![transitionContext containerView]) {
        return;
    }
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    UIView *containerView = [transitionContext containerView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (toVC.isBeingPresented) {
        [containerView addSubview:toView];
        
        CGFloat toViewWidth = containerView.frame.size.width* 2/3;
        CGFloat toViewHeight = containerView.frame.size.height* 2/3;
        
        toView.center = containerView.center;
        toView.bounds = CGRectMake(0, 0, 1, toViewHeight);
        
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                toView.bounds = CGRectMake(0, 0, toViewWidth, toViewHeight);
            } completion:^(BOOL finished) {
                BOOL isCancelled = [transitionContext transitionWasCancelled];
                [transitionContext completeTransition:!isCancelled];
            }];
        } else {
            UIView *dimmingView = [UIView new];
            [containerView insertSubview:dimmingView belowSubview:toView];
            
            dimmingView.backgroundColor = [[UIColor alloc] initWithWhite:0.0 alpha:0.5];
            dimmingView.center = containerView.center;
            dimmingView.bounds = CGRectMake(0, 0, toViewWidth, toViewHeight);
            
            [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                dimmingView.bounds = containerView.bounds;
                toView.bounds = CGRectMake(0, 0, toViewWidth, toViewHeight);
            } completion:^(BOOL finished) {
                BOOL isCancelled = [transitionContext transitionWasCancelled];
                [transitionContext completeTransition:!isCancelled];
            }];
        }
    }
    
    if (fromVC.isBeingDismissed) {
        CGFloat fromViewHeight = fromView.frame.size.height;
        [UIView animateWithDuration:duration animations:^{
            fromView.bounds = CGRectMake(0, 0, 1, fromViewHeight);
        } completion:^(BOOL finished) {
            BOOL isCancelled = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:!isCancelled];
        }];
    }
}

@end
