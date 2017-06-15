//
//  NSObject+CDD.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "NSObject+CDD.h"
#import "CDDContext.h"
#import <objc/runtime.h>
@implementation NSObject (CDD)
@dynamic context;

- (void)setContext:(CDDContext*)object {
    objc_setAssociatedObject(self, @selector(context), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CDDContext*)context {
    return objc_getAssociatedObject(self, @selector(context));
}
@end
