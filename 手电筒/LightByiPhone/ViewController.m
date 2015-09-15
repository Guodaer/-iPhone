//
//  ViewController.m
//  LightByiPhone
//
//  Created by 郭达 on 15/9/15.
//  Copyright (c) 2015年 guoda. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
/*
    AVFoundation.framework
 */

@interface ViewController ()

@end

@implementation ViewController
static BOOL isLightOn = NO;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (![device hasTorch]) {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"闪光灯" message:@"你有闪光灯吗亲" delegate:self cancelButtonTitle:@"好吧" otherButtonTitles:nil];
        [alert show];
    }
    
    UIButton *bu = [UIButton buttonWithType:UIButtonTypeSystem];
    bu.frame = CGRectMake(100, 100, 100, 30);
    [bu setTitle:@"hello Dage" forState:UIControlStateNormal];
    [bu addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bu];
    
}
//打开LED闪光灯
-(void)turnOnLed:(bool)update
{
    AVCaptureDevice *device=[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch])
    {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }
    if (update)
    {
        isLightOn=YES;
    }
}

//关闭LED闪光灯
-(void)turnOffLed:(bool)update
{
    AVCaptureDevice *device=[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch])
    {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
    if (update)
    {
        isLightOn=NO;
    }
}
- (void)btn {
    if (isLightOn)
    {
        [self turnOffLed:YES];
    }
    else
    {
        [self turnOnLed:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
