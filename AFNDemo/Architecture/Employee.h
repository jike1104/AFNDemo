//
//  Employee.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <Foundation/Foundation.h>

//@protocol EmployeeDelegate <NSObject>
//
//- (void)printDone;
//
//@end

@interface Employee : NSObject

//@property (nonatomic, weak) id<EmployeeDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)print;

@end
