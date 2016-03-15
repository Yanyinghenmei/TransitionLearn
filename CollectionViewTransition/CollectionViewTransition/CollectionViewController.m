//
//  CollectionViewController.m
//  CollectionViewTransition
//
//  Created by Daniel on 16/3/14.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    self.title = [NSString stringWithFormat:@"第%ld层",self.navigationController.viewControllers.count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    UICollectionViewFlowLayout *currentLayout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    CGFloat width = currentLayout.itemSize.width;
    
    layout.itemSize = CGSizeMake(width*1.2, width*1.2);
    layout.sectionInset = currentLayout.sectionInset;
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    
    CollectionViewController *newtVC = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
    
    newtVC.useLayoutToLayoutNavigationTransitions = YES;
    [self.navigationController pushViewController:newtVC animated:YES];
}


@end
