#import "GuessChecker.h"
#import "MMCode.h"

@implementation GuessChecker

@synthesize code, guess, mmCode;

-(void) execute {
    self.mmCode = [[[MMCode alloc] init] autorelease];
}

-(int) numberCorrect {
    return [[mmCode numberCorrectForCode: self.code andGuess: self.guess] intValue];
}

-(int) numberInWrongSpot {
    return [[mmCode numberInWrongSpotForCode: self.code andGuess: self.guess] intValue];
}

@end
