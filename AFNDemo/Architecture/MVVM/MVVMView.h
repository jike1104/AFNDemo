//
//  MVVMView.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMViewModel.h"

@interface MVVMView : UIView

- (void)setWithViewModel:(MVVMViewModel *) viewModel;

@end
