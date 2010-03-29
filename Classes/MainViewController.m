//
//  MainViewController.m
//  MagicNineBall
//
//  Created by Michael Bowman on 2/11/10.
//  Copyright AGL Software Labs 2010. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "PhraseFactory.h"

#import <QuartzCore/QuartzCore.h>

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        //phraseFactory = [[PhraseFactory alloc] init];
    }
    return self;
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:(BOOL)animated];
    [self becomeFirstResponder];
}

- (void) viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewDidAppear:(BOOL)animated];    
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
//    NSLog(@"-- Shake event has occurred!!!");
//    NSLog(@"Phrase: %s", [[factory getPhrase] UTF8String]);
    messageText.alpha = 0; // Hide the old message
    // Set the label to the new phrase
    PhraseFactory *factory = [PhraseFactory getInstance];
//    [messageText setText: [phraseFactory getRandomPhrase]]; 
    [messageText setText: [factory getRandomPhrase]];
    // Fade the text in 
    messageText.font = [UIFont boldSystemFontOfSize:17];
    messageText.transform = CGAffineTransformIdentity;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: .8];
    messageText.alpha = 1;
    [UIView commitAnimations];
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad {
    [super viewDidLoad];
    messageText.font = [UIFont boldSystemFontOfSize:17];
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [messageText release];
    [super dealloc];
}


@end
