#import <Foundation/Foundation.h>
#import "MMGuessResultImplementation.h"

@protocol MMGame <NSObject>

+(id) gameWithCode:(NSArray*) givenSecretCode;

@property (nonatomic, strong) NSArray* secretCode;
@property (nonatomic, strong) NSNumber* numberOfRemainingGuesses;
@property (nonatomic, strong) NSMutableArray* guessResults;

-(void) takeGuess: (NSArray*) guess;

@end
