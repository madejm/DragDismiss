//
//  MainViewController.m
//  dragDismiss
//
//  Created by Mejdej on 22/12/16.
//  Copyright (c) 2016 Mejdej. All rights reserved.
//

#import "MainViewController.h"
#import "PopupNavigationController.h"
#import "PopupViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (IBAction)show:(id)sender
{
    PopupViewController *vc = [[PopupViewController alloc] init];
    
    PopupNavigationController *nc = [[PopupNavigationController alloc] initWithRootViewController:vc];
    
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self.navigationController presentViewController:nc animated:YES completion:nil];
}

@end
