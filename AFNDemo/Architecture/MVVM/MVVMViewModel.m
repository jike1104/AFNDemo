//
//  MVVMViewModel.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "MVVMViewModel.h"

@interface MVVMViewModel ()

@end

@implementation MVVMViewModel

- (void)setWithModel:(MVVMModel *)model {
    self.model = model;
    self.contentStr = model.content;
}

- (void)onPrintClick {
    self.model.content = [NSString stringWithFormat:@"line %i",arc4random() % 1000 + 1];
    self.contentStr = self.model.content;
}

@end
