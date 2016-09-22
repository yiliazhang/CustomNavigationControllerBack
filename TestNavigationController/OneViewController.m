//
//  OneViewController.m
//  TestNavigationController
//
//  Created by apple on 16/8/12.
//  Copyright © 2016年 Datang. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"One";
    self.view.backgroundColor  = [UIColor yellowColor];
}

- (void)toNextViewController {
    [self.navigationController pushViewController:TwoViewController.new animated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" To Two" style:UIBarButtonItemStyleDone target:self action:@selector(toNextViewController)];
}


@end
