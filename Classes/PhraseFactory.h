//
//  PhraseFactory.h
//  MagicNineBall
//
//  Created by Michael Bowman on 2/15/10.
//  Copyright 2010 AGL Software Labs. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PhraseFactory : NSObject {
    NSMutableArray *phrases;
}

@property NSMutableArray *phrases;

- (NSString *) getRandomPhrase;
- (void) removePhraseAtIndex:(int)index;
- (void) loadPhrases;
- (void) add:(NSString *)phrase;
- (void) persistPhrases;

@end
