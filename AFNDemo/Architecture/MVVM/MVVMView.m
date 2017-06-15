//
//  MVVMView.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "MVVMView.h"
#import "KVOController.h"

@interface MVVMView ()

@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, strong) UIButton *buttonPrint;
@property (nonatomic, strong) MVVMViewModel *viewModel;

@end

@implementation MVVMView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        self.contentLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
        _contentLable.textAlignment = NSTextAlignmentCenter;
        _contentLable.font = [UIFont systemFontOfSize:13];
        _contentLable.textColor = [UIColor blackColor];
        _contentLable.backgroundColor = [UIColor blueColor];
        [self addSubview:_contentLable];

        self.buttonPrint = [UIButton buttonWithType:UIButtonTypeCustom];
        self.backgroundColor = [UIColor lightGrayColor];
        self.buttonPrint.frame = CGRectMake(100, 200, 100, 50);
        [self.buttonPrint setTitle:@"print" forState:UIControlStateNormal];
        [self.buttonPrint addTarget:self action:@selector(onPrintClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.buttonPrint];

    }
    return self;
}

- (void)onPrintClick {
    [self.viewModel onPrintClick];
}


- (void)setWithViewModel:(MVVMViewModel *) viewModel {
    
    self.viewModel = viewModel;
    
//    __weak typeof (self) weakSelf = self;
    
    [self.KVOController observe:viewModel keyPath:@"contentStr" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        if (!([change objectForKey:NSKeyValueChangeNewKey] == [NSNull null])) {
            
            NSString *newContent = change[NSKeyValueChangeNewKey];
            _contentLable.text = newContent;
//            NSLog(@"newContent = %@", newContent);

        }
    }];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
