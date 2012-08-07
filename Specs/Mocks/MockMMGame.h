#import <Foundation/Foundation.h>
#import "MMGame.h"
#import "MMGuessResult.h"

@interface MockMMGame : NSObject<MMGame> {
    MMGuessResult* lastGuessResult;
    NSArray* lastGuess;
}
@property(nonatomic, strong) MMGuessResult* lastGuessResult;
@property(nonatomic, strong) NSArray* lastGuess;

+(id) gameWithLastCorrect:(int) numberCorrect andInWrongSpot:(int) numberInWrongSpot;

@end
