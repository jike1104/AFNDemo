//
//  MVPView.h
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/14.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MVPPresenterDelegate <NSObject>

- (void)onPrintButtonClick;

@end

@interface MVPView : UIView

@property (nonatomic, weak) id<MVPPresenterDelegate> delegate;
- (void)printOnView:(NSString *)content;

@end
