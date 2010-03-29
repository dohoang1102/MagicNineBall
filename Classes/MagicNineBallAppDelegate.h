//
//  MagicNineBallAppDelegate.h
//  MagicNineBall
//
//  Created by Michael Bowman on 2/11/10.
//  Copyright AGL Software Labs 2010. All rights reserved.
//

@class MainViewController;

@interface MagicNineBallAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

