//
//  OverlayPresentationController.m
//  CustomModalTransition
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "OverlayPresentationController.h"

@interface OverlayPresentationController ()
@property (nonatomic, strong) UIView *dimmingView;
@end

@implementation OverlayPresentationController

- (UIView *)dimmingView {
    if (!_dimmingView) {
        _dimmingView = [UIView new];
    }
    return _dimmingView;
}

- (void)presentationTransitionWillBegin {
    
    [self.containerView addSubview:self.dimmingView];
    
    CGFloat dimmingViewInitailWidth = self.containerView.frame.size.width *2/3;
    CGFloat dimmingViewInitailHeight = self.containerView.frame.size.width *2/3;
    
    self.dimmingView.backgroundColor = [UIColor redColor];//[[UIColor alloc] initWithWhite:0.0f alpha:0.5];
    self.dimmingView.center = self.containerView.center;
    self.dimmingView.bounds = CGRectMake(0, 0, dimmingViewInitailWidth, dimmingViewInitailHeight);
    
    [[self.presentedViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.bounds = self.containerView.bounds;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin {
    [[self.presentedViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0.f;
    } completion:nil];
}

- (void)containerViewWillLayoutSubviews {
    self.dimmingView.center = self.containerView.center;
    self.dimmingView.bounds = self.containerView.bounds;
    
    CGFloat width = self.containerView.frame.size.width *2/3;
    CGFloat height = self.containerView.frame.size.height *2/3;
    
    self.presentedView.center = self.containerView.center;
    self.presentedView.bounds = CGRectMake(0, 0, width, height);
}


@end
