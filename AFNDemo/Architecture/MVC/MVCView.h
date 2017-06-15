//
//  MVCView.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MVCViewDelegate <NSObject>

- (void)onPrintButtonClick;

@end

@interface MVCView : UIView

@property (nonatomic, weak) id<MVCViewDelegate> delegate;
- (void)printOnView:(MVCModel *)model;

@end
