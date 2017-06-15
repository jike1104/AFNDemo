//
//  MVVMController.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "MVVMController.h"
#import "MVVMModel.h"
#import "MVVMViewModel.h"
#import "MVVMView.h"

@interface MVVMController ()

@property (nonatomic, strong) MVVMModel *mvvmModel;
@property (nonatomic, strong) MVVMViewModel *mvvmViewModel;
@property (nonatomic, strong) MVVMView *mvvmView;

@end

@implementation MVVMController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.mvvmModel = [[MVVMModel alloc] init];
    self.mvvmModel.content = @"line 0";
    
    self.mvvmViewModel = [[MVVMViewModel alloc] init];
    
    self.mvvmView = [[MVVMView alloc] init];
    self.mvvmView.frame = self.view.bounds;
    [self.view addSubview:self.mvvmView];
    
    [_mvvmView setWithViewModel:_mvvmViewModel];
    [_mvvmViewModel setWithModel:_mvvmModel];
    
    
    UIButton *buttonPrint = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPrint.frame = CGRectMake(100, 400, 100, 50);
    [buttonPrint setTitle:@"print" forState:UIControlStateNormal];
    [buttonPrint addTarget:self action:@selector(chage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonPrint];
}

- (void)chage {
    self.mvvmModel.content = [NSString stringWithFormat:@"line %i", arc4random() % 234 + 1];
    [self.mvvmViewModel setWithModel:self.mvvmModel];
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
