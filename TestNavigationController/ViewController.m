//
//  ViewController.m
//  TestNavigationController
//
//  Created by apple on 16/8/12.
//  Copyright © 2016年 Datang. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Root";
    
        // Note that images configured as the back bar button's background do
        // not have the current tintColor applied to them, they are displayed
        // as it.
    self.view.backgroundColor  = [UIColor orangeColor];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)toNextViewController {
    [self.navigationController pushViewController:OneViewController.new animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" To OneViewController" style:UIBarButtonItemStyleDone target:self action:@selector(toNextViewController)];
    
    
//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[self.view.backgroundColor colorWithAlphaComponent:0]] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = UIImage.new;
    
//    UIColor *barTintColor = self.view.backgroundColor;
//    UIColor *darkendBarTintColor = self.view.backgroundColor;
//    id navigationBarAppearance = self.navigationController.navigationBar;
//    [navigationBarAppearance setBarTintColor:darkendBarTintColor];
//    [self.navigationController.toolbar setBarTintColor:barTintColor];
//    self.navigationController.navigationBar.alpha = 0;
//    [UIView animateWithDuration:0.5 animations:^{
//        self.navigationController.navigationBar.alpha = 1;
//    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
