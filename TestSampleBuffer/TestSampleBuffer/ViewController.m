//
//  ViewController.m
//  TestSampleBuffer
//
//  Created by flagadmin on 2020/5/7.
//  Copyright © 2020 flagadmin. All rights reserved.
//
#import <ReplayKit/ReplayKit.h>
#import "FIAgoraClientBufferSocketManager.h"
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIView *broadcastButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[FIAgoraClientBufferSocketManager sharedManager] setupSocket];
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30);
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    [FIAgoraClientBufferSocketManager sharedManager].testBlock = ^(NSString * testText, CMSampleBufferRef sampleBuffer) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [label setText:testText];

        });
    };
    [self.view addSubview:self.broadcastButton];
}
- (UIView *)broadcastButton{
    if (!_broadcastButton) {
        RPSystemBroadcastPickerView *picker = [[RPSystemBroadcastPickerView alloc] initWithFrame:CGRectMake(100, 160, 60, 60)];
        _broadcastButton = picker;


    }
    return _broadcastButton;
}

@end
