//
//  DismissAnimation.m
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#import "DismissAnimation.h"

@implementation DismissAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.6;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    
    if (fromVC == nil || toVC == nil || containerView == nil) return;
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGPoint bottomLeftCorner = CGPointMake(0, screenBounds.size.height);
    CGRect finalFrame = CGRectMake(bottomLeftCorner.x, bottomLeftCorner.y, screenBounds.size.width, screenBounds.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:[transitionContext transitionWasCancelled]];
    }];
}

@end
