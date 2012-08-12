#import <Foundation/Foundation.h>
#import "MMGame.h"
#import "MMGuessResultImplementation.h"

@interface MockMMGame : NSObject<MMGame> {
    NSArray* lastGuess;
    NSNumber* numberOfRemainingGuesses;
}
@property(nonatomic, strong) NSArray* lastGuess;

+(id) gameWithLastCorrect:(int) numberCorrect andInWrongSpot:(int) numberInWrongSpot;

@end
