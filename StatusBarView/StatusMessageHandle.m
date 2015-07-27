//
//  StatusMessage.m
//  StatusBarView
//
//  Created by YouXianMing on 15/7/24.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "StatusMessageHandle.h"

#define  Status_Message  @"StatusMessage"

static UIWindow        *_statusWindow      = nil;
static NSMapTable      *_weakDictionary    = nil;
static NSTimeInterval   _animationDuration = 1.f;

@implementation StatusMessageHandle

+ (void)initialize {
    
    if (self == [StatusMessageHandle class]) {

        _weakDictionary = [NSMapTable strongToWeakObjectsMapTable];
        
        _statusWindow                        = [[UIWindow alloc] initWithFrame:STATUS_BAR_FRAME];
        _statusWindow.windowLevel            = UIWindowLevelStatusBar + 1;
        _statusWindow.userInteractionEnabled = NO;
        [_statusWindow makeKeyAndVisible];
    }
}

+ (void)showWithView:(UIView <StatusMessageProtocol> *)view duration:(NSTimeInterval)duration {

    [_weakDictionary setObject:view forKey:Status_Message];
    [_statusWindow addSubview:view];
    [view showWithDuration:duration];
}

+ (void)hideWithDuration:(NSTimeInterval)duration {

    UIView <StatusMessageProtocol> *tmpView = [_weakDictionary objectForKey:Status_Message];
    [tmpView hideWithDuration:duration];
}

+ (void)showAndHideDuration:(NSTimeInterval)duration {

    _animationDuration = duration;
}

+ (void)showWithView:(UIView<StatusMessageProtocol> *)view hideAfterSeconds:(NSTimeInterval)seconds {

    [_weakDictionary setObject:view forKey:Status_Message];
    [_statusWindow addSubview:view];
    [view showWithDuration:_animationDuration];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        UIView <StatusMessageProtocol> *tmpView = [_weakDictionary objectForKey:Status_Message];
        [tmpView hideWithDuration:_animationDuration];
    });
}

@end
