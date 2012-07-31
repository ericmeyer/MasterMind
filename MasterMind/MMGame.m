#import "MMGame.h"

@implementation MMGame

@synthesize numberOfRemainingGuesses;

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

@end
