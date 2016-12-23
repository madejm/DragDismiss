//
//  PopupViewController.m
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#import "PopupViewController.h"
#import "PopupNavigationController.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [self.navigationController.navigationBar addGestureRecognizer:((PopupNavigationController *)self.navigationController).pgr];
}

- (IBAction)dismiss:(id)sender
{
    [((PopupNavigationController *)self.navigationController).dismissDelegate dismissChild];
}

@end
