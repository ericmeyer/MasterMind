#import "GuessChecker.h"
#import "MMCode.h"
#import "ConciseKit.h"

@implementation GuessChecker

@synthesize code, guess, mmCode;

-(void) execute {
    self.mmCode = [[[MMCode alloc] init] autorelease];
}

-(int) numberCorrect {
    return [[mmCode numberCorrectForCode: [self.code $chars]
                                andGuess: [self.guess $chars]] intValue];
}

-(int) numberInWrongSpot {
    return [[mmCode numberInWrongSpotForCode: [self.code $chars]
                                    andGuess: [self.guess $chars]] intValue];
}

@end
