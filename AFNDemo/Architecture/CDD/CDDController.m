//
//  CDDController.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "CDDController.h"
#import "XGDView.h"
#import "XGDPresenter.h"

@interface CDDController ()

@property (nonatomic, strong) XGDView *cddView;
@property (nonatomic, strong) XGDPresenter *presenter;

@end

@implementation CDDController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.presenter  = [[XGDPresenter alloc] init];
    
    self.cddView = [[XGDView alloc] init];
    self.cddView.frame = self.view.bounds;
    [self.view addSubview:self.cddView];
    
    self.context = [[CDDContext alloc] init];
    self.context.presenter = self.presenter;
    self.context.view = self.cddView;
    
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
