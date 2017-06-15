//
//  CDDContext.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CDD.h"

@class CDDContext;

@interface CDDPresenter : NSObject

@property (nonatomic, weak) UIViewController *baseViewController;
////@property (nonatomic, weak) CDDView *view;
//@property (nonatomic, weak) id adapter;
@property (nonatomic, weak) CDDContext *context;


@end

//

@interface CDDView : UIView

//@property (nonatomic, weak) CDDPresenter *presenter;
@property (nonatomic, weak) CDDContext *context;

@end

//

@interface CDDContext : NSObject

@property (nonatomic, strong)CDDPresenter *presenter;
@property (nonatomic, strong)CDDView *view;

@end
