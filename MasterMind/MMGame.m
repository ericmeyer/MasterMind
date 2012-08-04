#import "MMGame.h"

@implementation MMGame

@synthesize numberOfRemainingGuesses, secretCode;

-(id) init {
    if ((self = [super init])) {
        self.numberOfRemainingGuesses = [NSNumber numberWithInt: 20];
    }
    return self;
}

-(BOOL) isOver {
    return NO;
}

-(BOOL) didWin {
    return NO;
}

-(void) takeGuess:(NSArray*) guess {
    self.numberOfRemainingGuesses = [NSNumber numberWithInt: self.numberOfRemainingGuesses.intValue - 1];
}

@end
