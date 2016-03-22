//
//  ShowDataVIew.m
//  MVVMTest
//
//  Created by Daniel on 16/3/21.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ShowDataVIew.h"
#import "Model.h"

@implementation ShowDataVIew


- (void)setModel:(Model *)model {
    _model = model;
    
    self.text = [NSString stringWithFormat:@"%@%@\n%@\n%@\n%@\n%@\n%@\n"
                 ,model.name ,model.id, model.addtime,
                 model.address, model.constellation,
                 model.expire_time, model.preferences];
}


@end
