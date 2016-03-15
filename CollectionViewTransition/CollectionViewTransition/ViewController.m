//
//  ViewController.m
//  CollectionViewTransition
//
//  Created by Daniel on 16/3/14.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)btn {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((self.view.bounds.size.width-20)/5, (self.view.bounds.size.width-20)/5);
    layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    
    CollectionViewController *cv = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cv] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
