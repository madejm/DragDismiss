//
//  MainNavigationController.m
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.definesPresentationContext = YES;
}

- (void)dismissChild
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
