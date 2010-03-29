//
//  PhraseFactory.m
//  MagicNineBall
//
//  Created by Michael Bowman on 2/15/10.
//  Copyright 2010 AGL Software Labs. All rights reserved.
//

#import "PhraseFactory.h"


@implementation PhraseFactory

@synthesize phrases;

static PhraseFactory *instance;

+ (PhraseFactory *) getInstance {
    if (!instance) {
        instance = [[super allocWithZone:NULL] init];
    }
    return instance;
}

- (void) add:(NSString *)phrase {
    [phrases addObject:phrase];
    [self persistPhrases];
}

- (NSString *) getRandomPhrase {
    int max = [phrases count];
    int idx = arc4random() % max;
    return [phrases objectAtIndex: idx];
}

- (id) init {
    if (self = [super init]) {
        // Load our phrases
        [self loadPhrases];
    }
    return self;
}

- (void) persistPhrases {
    NSString *plistFile = [[self getDocumentsFolder] stringByAppendingPathComponent:@"phrases.plist"];
    [phrases writeToFile:plistFile atomically:YES];
    [self loadPhrases]; //todo: do I need this?
}

- (void) removePhraseAtIndex:(int)index {
    [phrases removeObjectAtIndex:index];
    // Save back to plist
    [self persistPhrases];
}

- (NSString *) getDocumentsFolder {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

- (void) loadPhrases {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *userFile = [[self getDocumentsFolder] stringByAppendingPathComponent:@"phrases.plist"];
    
    if (![fileManager fileExistsAtPath:userFile]) {
        NSLog(@"Copying default plist to documents directory...");
        [self resetUserFile];
    }
    phrases = [[NSMutableArray arrayWithContentsOfFile:userFile] retain];
    NSLog(@"Loaded %d phrases from phrases.plist", [phrases count]);       
}

- (void) resetUserFile {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *userFile = [[self getDocumentsFolder] stringByAppendingPathComponent:@"phrases.plist"];
    NSString *defaultFile = [[NSBundle mainBundle] pathForResource:@"phrases" ofType:@"plist"];
    [fileManager copyItemAtPath:defaultFile toPath:userFile error:nil];
}

+ (id) allocWithZone:(NSZone *)zone {
    return [self getInstance];
}

- (id) copyWithZone:(NSZone *)zone {
    return self;
}

- (id) retain {
    return self;
}

- (NSUInteger) retainCount {
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void) release {
    //do nothing
}

- (id) autorelease {
    return self;
}

@end
