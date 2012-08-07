#import "GuessChecker.h"
#import "MMGuessResult.h"
#import "ConciseKit.h"

@implementation GuessChecker

@synthesize code, guess;

-(int) numberCorrect {
    return [[MMGuessResult numberCorrectForCode: [self.code $chars]
                                       andGuess: [self.guess $chars]] intValue];
}

-(int) numberInWrongSpot {
    return [[MMGuessResult numberInWrongSpotForCode: [self.code $chars]
                                           andGuess: [self.guess $chars]] intValue];
}

@end
