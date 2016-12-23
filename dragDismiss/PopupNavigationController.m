//
//  PopupNavigationController.m
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#import "PopupNavigationController.h"
#import "Interactor.h"
#import "DismissAnimation.h"

@interface PopupNavigationController ()

@property(nonatomic,strong) Interactor *interactor;

@end

@implementation PopupNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self prepare];
    }
    return self;
}

- (void)prepare
{
    self.interactor = [Interactor new];
    
    self.pgr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.pgr setEnabled:YES];
    
    self.transitioningDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (IBAction)handleGesture:(UIPanGestureRecognizer *)sender
{
    CGFloat percentThreshold = 0.3;
    
    UIView *view = self.view;
    
    // convert y-position to downward pull progress (percentage)
    CGPoint translation = [sender translationInView:view];
    CGFloat verticalMovement = translation.y / view.bounds.size.height;
    float downwardMovement = fmaxf((float)verticalMovement, 0.0);
    float downwardMovementPercent = fminf(downwardMovement, 1.0);
    CGFloat progress = (CGFloat)downwardMovementPercent;
    
    if (self.interactor == nil) return;
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            self.interactor.hasStarted = YES;
            [self.dismissDelegate dismissChild];
            break;
        case UIGestureRecognizerStateChanged:
            self.interactor.shouldFinish = progress > percentThreshold;
            [self.interactor updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateCancelled:
            self.interactor.hasStarted = NO;
            [self.interactor cancelInteractiveTransition];
            break;
        case UIGestureRecognizerStateEnded:
            self.interactor.hasStarted = NO;
            if (self.interactor.shouldFinish)
                [self.interactor finishInteractiveTransition];
            else
                [self.interactor cancelInteractiveTransition];
            break;
        default:
            break;
    }
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissAnimation new];
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactor.hasStarted ? self.interactor : nil;
}

@end
