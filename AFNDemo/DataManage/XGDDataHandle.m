//
//  XGDDataHandle.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/10.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "XGDDataHandle.h"

@implementation XGDDataHandle

DEFINE_SINGLETON_FOR_CLASS(XGDDataHandle)

- (void)checkIfTheNetWorkIsConnectedWithReturnValueBlock:(NetworkStatusBlock) networkStatus {
    
    AFNetworkReachabilityManager *manage = [AFNetworkReachabilityManager sharedManager];
    [manage startMonitoring];
    [manage setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        networkStatus(status);
    }];
    
}

#pragma mark - 开始监控网络
-(void)startWatchNetworkReachability
{
    AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable){
//            DDLOG(@"无网络连接");
        }
    }];
}

#pragma mark - 检查网络
-(BOOL)checkNetWorkStatus
{
    [NSThread sleepForTimeInterval:1.0f];
    AFNetworkReachabilityManager * reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    if(reachabilityManager.networkReachabilityStatus == AFNetworkReachabilityStatusUnknown){
        return YES;
    }
    NSLog(@"networkReachabilityStatus = %ld", reachabilityManager.networkReachabilityStatus);
    return reachabilityManager.isReachable;
    
}

@end
