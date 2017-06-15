//
//  Manager.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "Manager.h"

@implementation Manager

+ (instancetype)sharedInstance {
    
    static Manager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Manager alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(printDone) name:Notif_PrintTaskDone object:nil];
    }
    return self;
}

- (void)celebratePrintDone {
    NSLog(@"print Done");
}

- (void)beginPrintTask {
    NSLog(@"beginPrintTask");

//    [Employee sharedInstance].delegate = self;
//
//    [[Employee sharedInstance] print];
    [[NSNotificationCenter defaultCenter] postNotificationName:Notif_BeginPrintTask object:nil];
}

- (void)printDone {
    NSLog(@"print Done");
}

@end
