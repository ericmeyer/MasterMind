#import "MockMMGame.h"

@implementation MockMMGame

@synthesize lastGuessResult, lastGuess;

+(id) gameWithLastCorrect:(int) numberCorrect andInWrongSpot:(int) numberInWrongSpot {
    MockMMGame* game = [MockMMGame new];
    MMGuessResult* guessResult = [MMGuessResult new];
    guessResult.numberCorrect = [NSNumber numberWithInt: numberCorrect];
    guessResult.numberInWrongSpot = [NSNumber numberWithInt: numberInWrongSpot];
    game.lastGuessResult = guessResult;
    return game;
}

-(void) takeGuess:(NSArray*) guess {
    self.lastGuess = guess;
}

@end
