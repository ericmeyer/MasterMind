#import "MockMMGame.h"
#import "MockMMGuessResult.h"

@implementation MockMMGame

@synthesize guessResults, lastGuess, secretCode, numberOfRemainingGuesses;

-(id) init {
    if ((self = [super init])) {
        self.guessResults = [NSMutableArray array];
    }
    return self;
}

+(id) gameWithCode:(NSArray*) givenSecretCode {
    MockMMGame* game = [MockMMGame new];
    game.secretCode = givenSecretCode;
    return game;
}

+(id) gameWithLastCorrect:(int) numberCorrect andInWrongSpot:(int) numberInWrongSpot {
    MockMMGame* game = [MockMMGame new];
    MockMMGuessResult* result;
    result = [MockMMGuessResult withNumberCorrect: numberCorrect
                                numberInWrongSpot: numberInWrongSpot];
    [game.guessResults addObject: result];
    return game;
}

-(void) takeGuess:(NSArray*) guess {
    self.lastGuess = guess;
}

-(BOOL) didWin {
    return NO;
}

@end
