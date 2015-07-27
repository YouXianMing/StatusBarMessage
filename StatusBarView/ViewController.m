//
//  ViewController.m
//  StatusBarView
//
//  Created by YouXianMing on 15/7/24.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "StatusMessageHandle.h"
#import "MessageView.h"

@interface ViewController ()

@property(nonatomic,strong) UIWindow *statusWindow;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self performSelector:@selector(showMessageEvent) withObject:nil afterDelay:5.f];
}

- (void)showMessageEvent {

    [StatusMessageHandle showAndHideDuration:2.f];
    [StatusMessageHandle showWithView:[MessageView messageViewWithTitle:@"YouXianMing" backgroundColor:[UIColor whiteColor]]
                     hideAfterSeconds:3.f];
}

@end
