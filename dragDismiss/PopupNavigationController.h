//
//  PopupNavigationController.h
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupNavigationController : UINavigationController <UIViewControllerTransitioningDelegate>

@property(nonatomic,strong) UIPanGestureRecognizer *pgr;

@end
