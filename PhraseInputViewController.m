//
//  PhraseInputViewController.m
//  MagicNineBall
//
//  Created by Michael Bowman on 3/19/10.
//  Copyright 2010 AGL Software Labs. All rights reserved.
//

#import "PhraseInputViewController.h"
#import "PhraseFactory.h";


@implementation PhraseInputViewController

@synthesize delegate;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad {
    [super viewDidLoad];
    [textField becomeFirstResponder];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)uiTextField {
    [textField resignFirstResponder];
    NSLog(@"textFieldShouldReturn!");

    PhraseFactory *factory = [PhraseFactory getInstance];
    //[messageText setText: [factory getRandomPhrase]];
    [factory add:[textField text]];

    // Dismiss the PhraseInputView
    [self.delegate phraseInputViewControllerDidFinish:self];
    
    return YES;
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
    [super dealloc];
}


@end
