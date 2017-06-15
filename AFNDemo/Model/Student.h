//
//  Student.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/12.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, assign) int age;

@end
