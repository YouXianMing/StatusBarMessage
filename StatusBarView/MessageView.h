//
//  MessageView.h
//  StatusBarView
//
//  Created by YouXianMing on 15/7/24.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusMessageProtocol.h"

@interface MessageView : UIView <StatusMessageProtocol>

/**
 *  创建出messageView
 *
 *  @param title 标题
 *  @param color 颜色
 *
 *  @return 实例对象
 */
+ (instancetype)messageViewWithTitle:(NSString *)title backgroundColor:(UIColor *)color;

@end
