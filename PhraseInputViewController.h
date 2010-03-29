//
//  PhraseInputViewController.h
//  MagicNineBall
//
//  Created by Michael Bowman on 3/19/10.
//  Copyright 2010 AGL Software Labs. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol PhraseInputViewControllerDelegate;


@interface PhraseInputViewController : UIViewController <UITextFieldDelegate> {
    id <PhraseInputViewControllerDelegate> delegate;
    IBOutlet UITextField *textField;
}


@property (nonatomic, assign) id <PhraseInputViewControllerDelegate> delegate;

@end

@protocol PhraseInputViewControllerDelegate
- (void) phraseInputViewControllerDidFinish:(PhraseInputViewController *)controller;
@end