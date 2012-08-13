#import <Foundation/Foundation.h>
#import "MMGuessResult.h"

@interface MockMMGuessResult : NSObject<MMGuessResult>

+(id) withNumberCorrect: (int) givenNumberCorrect
      numberInWrongSpot: (int) givenNumberInWrongSpot
               andGuess: (NSArray*) givenGuess;

+(id) withNumberCorrect: (int) givenNumberCorrect
      numberInWrongSpot: (int) givenNumberInWrongSpot;

@end
