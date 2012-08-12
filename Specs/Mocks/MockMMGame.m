#import "MockMMGame.h"

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
    MMGuessResultImplementation* guessResult = [MMGuessResultImplementation new];
    guessResult.numberCorrect = [NSNumber numberWithInt: numberCorrect];
    guessResult.numberInWrongSpot = [NSNumber numberWithInt: numberInWrongSpot];
    [game.guessResults addObject: guessResult];
    return game;
}

-(void) takeGuess:(NSArray*) guess {
    self.lastGuess = guess;
}

@end
