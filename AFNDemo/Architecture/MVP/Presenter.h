//
//  Presenter.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPView.h"
#import "MVPModel.h"

@interface Presenter : NSObject

@property (nonatomic, strong) MVPModel *mvpModel;
@property (nonatomic, strong) MVPView *mvpView;

- (void)printTask;

@end
