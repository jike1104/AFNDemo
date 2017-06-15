//
//  MVVMViewModel.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMModel.h"

@interface MVVMViewModel : NSObject

@property (nonatomic, strong) MVVMModel *model;
@property (nonatomic, strong)NSString *contentStr;
- (void)onPrintClick;
- (void)setWithModel:(MVVMModel *)model;

@end
