//
//  ViewController.m
//  MVVMTest
//
//  Created by Daniel on 16/3/21.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ViewController.h"

#import "ViewModel.h"
#import "ShowDataVIew.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    //View
    ShowDataVIew *view =[[ShowDataVIew alloc] initWithFrame:CGRectMake(0, 200, 300, 200)];
    [self.view addSubview:view];
    view.textAlignment = NSTextAlignmentCenter;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showViewClick:)];
    [view addGestureRecognizer:tap];
    
    //ViewModel
    [ViewModel modelsWithBlock:^(NSArray *models) {
        for (Model *model in models) {
            
            // 这里只有一个model
            [view setModel:model];
        }
    }];
}

- (void)showViewClick:(UIGestureRecognizer *)sender {
    ShowDataVIew *view = (ShowDataVIew *)sender.view;
    [ViewModel detailClick:sender.view inViewController:self info:view.model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
