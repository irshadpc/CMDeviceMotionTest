//
//  CMTestViewController.h
//  CMTest
//
//  Created by shuichi on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CMTestViewController : UIViewController {

	CMMotionManager		*motionManager;

	IBOutlet UILabel	*x1Label;
	IBOutlet UILabel	*y1Label;
	IBOutlet UILabel	*z1Label;

	IBOutlet UILabel	*x2Label;
	IBOutlet UILabel	*y2Label;
	IBOutlet UILabel	*z2Label;

	IBOutlet UILabel	*x3Label;
	IBOutlet UILabel	*y3Label;
	IBOutlet UILabel	*z3Label;
}
@property (nonatomic, retain) CMMotionManager *motionManager;

@end

