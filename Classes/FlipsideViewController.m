//
//  FlipsideViewController.m
//  MagicNineBall
//
//  Created by Michael Bowman on 2/11/10.
//  Copyright AGL Software Labs 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "PhraseFactory.h"
#import "PhraseInputViewController.h"
#import <UIKit/UIKit.h>

@implementation FlipsideViewController

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Make the table editable
    [phrasesTableView setEditing:YES animated:YES];
}

- (IBAction) done {
	[self.delegate flipsideViewControllerDidFinish:self];	
}

- (void)phraseInputViewControllerDidFinish:(PhraseInputViewController *)controller {
    // Reload the data table
    [phrasesTableView reloadData];
	[self dismissModalViewControllerAnimated:YES];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
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


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    PhraseFactory *factory = [PhraseFactory getInstance];
    return [[factory phrases] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Attempt to dequeue a cell. If this is not possible, create one
    //    UITableViewCellStyle style = UITableViewCellStyleDefault;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseCell"];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BaseCell"] autorelease];
    }
    //cell.backgroundColor = [UIColor whiteColor];
    PhraseFactory *factory = [PhraseFactory getInstance];
    NSArray *phrases = [factory phrases];
    cell.textLabel.text = [phrases objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Removing item %d", [indexPath row]);
    PhraseFactory *factory = [PhraseFactory getInstance];
    [factory removePhraseAtIndex:[indexPath row]];
    NSLog(@"Removed item from phrase factory...");
    [phrasesTableView reloadData];
    NSLog(@"Reloaded table view");
}

- (IBAction) resetPhrases {
    NSLog(@"Resetting phrases to default...");
    PhraseFactory *factory = [PhraseFactory getInstance];
    [factory resetUserFile];
    [phrasesTableView reloadData];
}

- (IBAction) addItem {
    NSLog(@"Getting input from user...");
    //NSString *phrase = getNewPhrase();
    PhraseInputViewController *controller = [[PhraseInputViewController alloc] initWithNibName:@"PhraseInputView" bundle:nil];
	controller.delegate = self;
	
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
    NSLog(@"end of addItem");
}


//- (NSString *) getNewPhrase {
//    CFRunLoopRef currentLoop = CFRunLoopGetCurrent();
//    ModalAlertDelegate *madelegate = [[ModalAlertDelegate alloc] initWithRunLoop:currentLoop];
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter New Phrase" 
//                                              message:@"msg here" 
//                                              delegate:madelegate 
//                                              cancelButtonTitle:@"Cancel" 
//                                              otherButtonTitles:@"Add", nil];
//    
//    // build text field
//    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 260.0f, 30.0f)];
//    tf.borderStyle = UITextBorderStyleRoundedRect;
//    tf.tag = 9999;
//    tf.placeholder = @"prompt";
//    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
//    tf.keyboardType = UIKeyboardTypeAlphabet;
//    tf.keyboardAppearance = UIKeyboardAppearanceAlert;
//    tf.autocapitalizationType = UITextAutocapitalizationTypeWords;
//    tf.autocorrectionType = UITextAutocorrectionTypeNo;
//    tf.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    
//    // show alert and wait for it
//    [alertView show];
//    while (CGRectEqualToRect(alertView.bounds, CGRectZero));
//    
//    // Find the center for the text field and add it
//    CGRect bounds = alertView.bounds;
//    tf.center = CGPointMake(bounds.size.width / 2.0f, bounds.size.height / 2.0f - 10.0f);
//    [alertView addSubview:tf];
//    [tf release];
//    
//    // Set the field to first responder and move it into place
//    [madelegate performSelector:@selector(moveAlert:) withObject:alertView afterDelay: 0.7f];
//    
//    // Start the run loop
//    CFRunLoopRun();
//    
//    // Retrieve the user choices
//    NSUInteger index = madelegate.index;
//    NSString *answer = [[madelegate.text copy] autorelease];
//    if (index == 0) answer = nil; // assumes cancel in position 0
//    
//    [alertView release];
//    [madelegate release];
//    return answer;
//}

- (void)dealloc {
    [super dealloc];
}


@end
