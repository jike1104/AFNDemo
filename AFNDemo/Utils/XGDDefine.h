//
//  XGDDefine.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/10.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#ifndef XGDDefine_h
#define XGDDefine_h

/**
 宏作用:单例生成宏
 使用方法:http://blog.csdn.net/totogo2010/article/details/8373642
 */
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

#define Notif_BeginPrintTask @"Notif_BeginPrintTask"
#define Notif_PrintTaskDone @"Notif_PrintTaskDone"

#endif /* XGDDefine_h */
