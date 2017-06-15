//
//  XGDDataHandle.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/10.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^NetworkStatusBlock) (AFNetworkReachabilityStatus status);

@interface XGDDataHandle : NSObject

DEFINE_SINGLETON_FOR_HEADER(XGDDataHandle)
//@property (readwrite, nonatomic, copy) AFNetworkReachabilityStatusBlock networkReachabilityStatusBlock;

- (void)checkIfTheNetWorkIsConnectedWithReturnValueBlock:(NetworkStatusBlock) networkStatus;

/**
 监听网络状态
 */
-(void)startWatchNetworkReachability;

/**
 检查网络状态
 
 @return 返回bool值，YES有网络，NO无网络
 */
-(BOOL)checkNetWorkStatus;

@end
