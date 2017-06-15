//
//  MVCView.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "MVCView.h"

@interface MVCView ()

@property (nonatomic, strong) UIButton *buttonPrint;

@end
@implementation MVCView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.buttonPrint = [UIButton buttonWithType:UIButtonTypeSystem];
        self.backgroundColor = [UIColor lightGrayColor];
        self.buttonPrint.frame = CGRectMake(100, 100, 100, 50);
        [self.buttonPrint setTitle:@"print" forState:UIControlStateNormal];
        [self.buttonPrint addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.buttonPrint];
    }
    return self;
}

- (void)onPrintClick {
    if (_delegate && [_delegate respondsToSelector:@selector(onPrintButtonClick)]) {
        [_delegate onPrintButtonClick];
    }
}

- (void)printOnView:(MVCModel *)model {
    NSLog(@"print model`s content:%@", model.content);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
