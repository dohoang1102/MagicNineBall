//
//  MagicNineBallAppDelegate.m
//  MagicNineBall
//
//  Created by Michael Bowman on 2/11/10.
//  Copyright AGL Software Labs 2010. All rights reserved.
//

#import "MagicNineBallAppDelegate.h"
#import "MainViewController.h"

@implementation MagicNineBallAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {

    application.applicationSupportsShakeToEdit = YES;
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
