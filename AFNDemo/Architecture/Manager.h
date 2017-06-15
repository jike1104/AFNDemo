//
//  Manager.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Employee.h"

@interface Manager : NSObject
///<>

+ (instancetype)sharedInstance;

- (void)celebratePrintDone;

- (void)beginPrintTask;

@end
