#import "GuessChecker.h"
#import "MMGuessResultImplementation.h"
#import "ConciseKit.h"

@implementation GuessChecker

@synthesize code, guess;

-(int) numberCorrect {
    return [[MMGuessResultImplementation numberCorrectForCode: [self.code $chars]
                                       andGuess: [self.guess $chars]] intValue];
}

-(int) numberInWrongSpot {
    return [[MMGuessResultImplementation numberInWrongSpotForCode: [self.code $chars]
                                           andGuess: [self.guess $chars]] intValue];
}

@end
