//
//  ViewModel.h
//  MVVMTest
//
//  Created by Daniel on 16/3/21.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewModel : NSObject

// 数据下载
+ (void)modelsWithBlock:(void(^)(NSArray *models))block;

// UI交互
+ (void)detailClick:(UIView *)clickView inViewController:(UIViewController *)viewController info:(id)info;

@end
