//
//  FlipsideViewController.h
//  MagicNineBall
//
//  Created by Michael Bowman on 2/11/10.
//  Copyright AGL Software Labs 2010. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
    IBOutlet UITableView *phrasesTableView;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction) done;
- (IBAction) addItem;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

