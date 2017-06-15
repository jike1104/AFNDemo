//
//  MVPController.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "MVPController.h"

@interface MVPController ()

@property (nonatomic, strong) Presenter *present;
@property (nonatomic, strong) MVPView *mvpView;
@property (nonatomic, strong) MVPModel *mvpModel;

@end

@implementation MVPController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mvpView = [[MVPView alloc] init];
    _mvpView.frame = self.view.bounds;
    [self.view addSubview:_mvpView];
    
    self.mvpModel = [[MVPModel alloc] init];
    _mvpModel.content = @"line 0";
    
    self.present = [[Presenter alloc] init];
    _present.mvpView = _mvpView;
    _present.mvpModel = _mvpModel;
    
    _mvpView.delegate = _present;
    
    [_present printTask];
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
