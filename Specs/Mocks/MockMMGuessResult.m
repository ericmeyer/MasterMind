#import "MockMMGuessResult.h"

@implementation MockMMGuessResult

@synthesize numberCorrect, numberInWrongSpot, guess;

+(id) withNumberCorrect: (int) givenNumberCorrect
      numberInWrongSpot: (int) givenNumberInWrongSpot
               andGuess: (NSArray*) givenGuess {
    MockMMGuessResult* guessResult = [MockMMGuessResult new];
    guessResult.numberCorrect = [NSNumber numberWithInt: givenNumberCorrect];
    guessResult.numberInWrongSpot = [NSNumber numberWithInt: givenNumberInWrongSpot];
    guessResult.guess = givenGuess;
    return guessResult;
}

+(id) withNumberCorrect: (int) givenNumberCorrect
      numberInWrongSpot: (int) givenNumberInWrongSpot {
    return [self withNumberCorrect: givenNumberCorrect
                 numberInWrongSpot: givenNumberInWrongSpot
                          andGuess: [NSArray array]];
}

@end
