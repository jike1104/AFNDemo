//
//  MVPView.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "MVPView.h"

@interface MVPView ()

@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, strong) UIButton *buttonPrint;

@end

@implementation MVPView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.contentLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 300, 30)];
        _contentLable.textAlignment = NSTextAlignmentCenter;
        _contentLable.textColor = [UIColor blackColor];
        [self addSubview:_contentLable];
        
        self.buttonPrint = [UIButton buttonWithType:UIButtonTypeSystem];
        self.backgroundColor = [UIColor lightGrayColor];
        self.buttonPrint.frame = CGRectMake(100, 200, 100, 50);
        [self.buttonPrint setTitle:@"print" forState:UIControlStateNormal];
        [self.buttonPrint addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.buttonPrint];

    }
    return self;
}

- (void)printOnView:(NSString *)content {
    _contentLable.text = content;
}

- (void)onPrintClick {
    if (_delegate && [_delegate respondsToSelector:@selector(onPrintButtonClick)]) {
        [_delegate onPrintButtonClick];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
