//
//  CMTestViewController.m
//  CMTest
//
//  Created by shuichi on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CMTestViewController.h"

@implementation CMTestViewController

@synthesize motionManager;


- (void)viewDidLoad {
    [super viewDidLoad];

    // CMMotionManager生成
	CMMotionManager *manager = [[CMMotionManager alloc] init];
    self.motionManager = manager;
	[manager release];

	// ジャイロデータ取得間隔 [sec]
	self.motionManager.gyroUpdateInterval = 1.0 / 1.0;
	
	
    // ジャイロデータ取得開始
	NSOperationQueue *queueGyro = [[[NSOperationQueue alloc] init] autorelease];
	[self.motionManager startGyroUpdatesToQueue:queueGyro
									withHandler:^(CMGyroData *data, NSError *error) {
										dispatch_async(dispatch_get_main_queue(), ^{
											// ジャイロデータ取得時に実行する処理
											x1Label.text = [NSString stringWithFormat:@"%f", data.rotationRate.x];
											y1Label.text = [NSString stringWithFormat:@"%f", data.rotationRate.y];
											z1Label.text = [NSString stringWithFormat:@"%f", data.rotationRate.z];
										});
									}];
	

	// デバイスモーション取得間隔 [sec]
	self.motionManager.deviceMotionUpdateInterval = 1.0 / 1.0;

	// デバイスモーションの取得開始
	NSOperationQueue *queueMotion = [[[NSOperationQueue alloc] init] autorelease];
	[self.motionManager startDeviceMotionUpdatesToQueue:queueMotion
											withHandler:^(CMDeviceMotion *data, NSError *error) {
												dispatch_async(dispatch_get_main_queue(), ^{
													// rotationRateの表示
													x2Label.text = [NSString stringWithFormat:@"%f", data.rotationRate.x];
													y2Label.text = [NSString stringWithFormat:@"%f", data.rotationRate.y];
													z2Label.text = [NSString stringWithFormat:@"%f", data.rotationRate.z];

													// gravityの表示
													x3Label.text = [NSString stringWithFormat:@"%f", data.gravity.x];
													y3Label.text = [NSString stringWithFormat:@"%f", data.gravity.y];
													z3Label.text = [NSString stringWithFormat:@"%f", data.gravity.z];
												});
											}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}


- (void)dealloc {
	[self.motionManager stopGyroUpdates];
	self.motionManager = nil;
	[x1Label release];
	[y1Label release];
	[z1Label release];
	[x2Label release];
	[y2Label release];
	[z2Label release];
	[x3Label release];
	[y3Label release];
	[z3Label release];
    [super dealloc];
}

@end
