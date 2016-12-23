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
@property(nonatomic,strong) PopupNavigationController *nc;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    PopupViewController *vc = [[PopupViewController alloc] init];
    
    self.nc = [[PopupNavigationController alloc] initWithRootViewController:vc];
    self.nc.dismissDelegate = self.navigationController;
}

- (IBAction)show:(id)sender
{
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self.navigationController presentViewController:self.nc animated:YES completion:nil];
}

@end
