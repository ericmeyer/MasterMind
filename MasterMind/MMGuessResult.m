#import "MMGuessResult.h"
#import "MMCode.h"

@implementation MMGuessResult

@synthesize numberCorrect, numberInWrongSpot;

+(id) resultFromCode:(NSArray*) code andGuess:(NSArray*) guess {
    MMGuessResult* result = [MMGuessResult new];
    MMCode* codeChecker = [MMCode new];
    result.numberCorrect = [codeChecker numberCorrectForCode: code andGuess: guess];
    result.numberInWrongSpot = [codeChecker numberInWrongSpotForCode: code andGuess: guess];
    return result;
}

@end
