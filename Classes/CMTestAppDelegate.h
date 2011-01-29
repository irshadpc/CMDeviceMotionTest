//
//  CMTestAppDelegate.h
//  CMTest
//
//  Created by shuichi on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMTestViewController;

@interface CMTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CMTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CMTestViewController *viewController;

@end

