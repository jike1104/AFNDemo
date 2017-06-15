//
//  Presenter.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "Presenter.h"

@implementation Presenter

- (void)printTask {
    NSString *presentContent = _mvpModel.content;
    [_mvpView printOnView:presentContent];
}

- (void)onPrintButtonClick {
    [_mvpView printOnView:[NSString stringWithFormat:@"line %i", arc4random() % 10 +1]];
}

@end
