//
//  ViewController+Algorithm.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/13.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "ViewController+Algorithm.h"
#import "Manager.h"
#import "Employee.h"
#import "MVVMController.h"
//#import "CDDController.h"
@implementation ViewController (Algorithm)

- (void)architecture {
//    [Employee sharedInstance];
//    [[Manager sharedInstance] beginPrintTask];
    
//    CDDController *mvpVC = [[CDDController alloc] init];

    MVCController *mvcVC = [[MVCController alloc] init];
    [self presentViewController:mvcVC animated:YES completion:nil];
 
    
}

@end
