//
//  StatusMessage.h
//  StatusBarView
//
//  Created by YouXianMing on 15/7/24.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusMessageProtocol.h"

@interface StatusMessage : UIView

/**
 *  显示加载的view
 *
 *  @param view     实现了StatusMessageProtocol的view
 *  @param duration 动画显示时间
 */
+ (void)showWithView:(UIView <StatusMessageProtocol> *)view duration:(NSTimeInterval)duration;

/**
 *  隐藏加载的view
 *
 *  @param duration 隐藏动画显示时间
 */
+ (void)hideWithDuration:(NSTimeInterval)duration;


///////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  设置显示以及隐藏的动画时间(不设置,默认为1s)
 *
 *  @param duration 动画时间
 */
+ (void)showAndHideDuration:(NSTimeInterval)duration;

/**
 *  显示view,然后几秒后隐藏
 *
 *  @param view    实现了StatusMessageProtocol的view
 *  @param seconds 延时几秒后隐藏
 */
+ (void)showWithView:(UIView<StatusMessageProtocol> *)view hideAfterSeconds:(NSTimeInterval)seconds;

@end
