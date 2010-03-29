//
//  MainViewController.h
//  MagicNineBall
//
//  Created by Michael Bowman on 2/11/10.
//  Copyright AGL Software Labs 2010. All rights reserved.
//

#import "FlipsideViewController.h"
#import "PhraseFactory.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    PhraseFactory *phraseFactory;
    IBOutlet UILabel *messageText;
}

- (IBAction)showInfo;

@end
