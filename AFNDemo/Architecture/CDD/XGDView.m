//
//  XGDView.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "XGDView.h"
#import "XGDPresenter.h"

@interface XGDView ()

@property (nonatomic, strong)UIButton *button;

@end

@implementation XGDView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(100, 200, 100, 50);
        [_button setTitle:@"BUTTON" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        
    }
    return self;
}

- (void)onButtonClick {
    XGDPresenter *presenter = (XGDPresenter*)self.context.presenter;
    [presenter printPaper];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
