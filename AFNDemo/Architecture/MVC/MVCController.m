//
//  MVCController.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "MVCController.h"

@interface MVCController ()<MVCViewDelegate>

@property (nonatomic ,strong) MVCModel *mvcModel;
@property (nonatomic, strong) MVCView *mvcView;

@end

@implementation MVCController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor greenColor];
    self.mvcView = [[MVCView alloc] init];
    [self.view addSubview:self.mvcView];
    self.mvcView.delegate = self;
    self.mvcView.frame = self.view.bounds;
    
    self.mvcModel = [[MVCModel alloc] init];
    self.mvcModel.content = @"line 0";
    
    [self printMVCModel];
}

- (void)onPrintButtonClick {
    _mvcModel.content = [NSString stringWithFormat:@"line %d", arc4random() % 10 + 1];
    [_mvcView printOnView:_mvcModel];
}

- (void)printMVCModel {
    [self.mvcView printOnView:self.mvcModel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
