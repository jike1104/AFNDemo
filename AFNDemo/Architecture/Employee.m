//
//  Employee.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "Employee.h"
//#import "Manager.h"
@implementation Employee

+ (instancetype)sharedInstance {
    
    static Employee *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Employee alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(print) name:Notif_BeginPrintTask object:nil];
    }
    return self;
}

- (void)print {
    NSLog(@"print");
//    if (_delegate && [_delegate respondsToSelector:@selector(printDone)]) {
//        [_delegate printDone];
//    }
//    [[Manager sharedInstance] celebratePrintDone];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_PrintTaskDone object:nil];
    
}

@end
