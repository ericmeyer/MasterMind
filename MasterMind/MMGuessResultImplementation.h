#import <Foundation/Foundation.h>
#import "MMGuessResult.h"

@interface MMGuessResultImplementation : NSObject<MMGuessResult>

+(id) resultFromCode:(NSArray*) code andGuess:(NSArray*) guess;

+(NSNumber*) numberCorrectForCode: (NSArray*) code andGuess: (NSArray*) guess;
+(NSNumber*) numberInWrongSpotForCode: (NSArray*) code andGuess: (NSArray*) guess;

@end
