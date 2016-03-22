//
//  ViewModel.m
//  MVVMTest
//
//  Created by Daniel on 16/3/21.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"
#import "DetailViewController.h"

@implementation ViewModel

+ (void)modelsWithBlock:(void (^)(NSArray *))block {
    NSDictionary *dataDic = @{
                              @"id" : @"123",
                              @"address" : @"China",
                              @"addtime" : @"1451900764",
                              @"birth" : @"2016-01-01",
                              @"blood_type" : @"B",
                              @"constellation" : @"Capricorn",
                              @"email" : @"******@qq.com",
                              @"expire_time" : @1735983720,
                              @"height" : @"185",
                              @"name" : @"Daniel",
                              @"preferences" : @"1,2,3",
                              @"sex" : @"male",
                              @"simg" : @"/Public/upfile/2016-01-27/1453886093751.jpg",
                              @"user_id" : @"14",
                              @"weight" : @"69"
                              };
    
    
    Model *model = [Model new];
    [model setValuesForKeysWithDictionary:dataDic];
    
    block(@[model]);
}

+ (void)detailClick:(UIView *)clickView inViewController:(UIViewController *)viewController info:(id)info {
    // 这里可以是跳转之前的数据处理
    Model *model = info;
    DetailViewController *detailVC = [DetailViewController new];
    detailVC.title = model.name;
    
    [viewController.navigationController pushViewController:detailVC animated:YES];
}

@end
