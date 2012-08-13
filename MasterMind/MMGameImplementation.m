#import "MMGameImplementation.h"
#import "MMGuessResultImplementation.h"

@implementation MMGameImplementation

@synthesize numberOfRemainingGuesses, secretCode, guessResults;

+(id) gameWithCode:(NSArray*) givenSecretCode {
    MMGameImplementation* game = [MMGameImplementation new];
    game.secretCode = givenSecretCode;
    return game;
}

-(id) init {
    if ((self = [super init])) {
        self.numberOfRemainingGuesses = [NSNumber numberWithInt: 12];
        self.guessResults = [NSMutableArray array];
    }
    return self;
}

-(BOOL) isOver {
    return [self didWin] || [self outOfGuesses];
}

-(BOOL) didWin {
    return [[self.guessResults.lastObject numberCorrect] intValue] == 4;
}

-(BOOL) outOfGuesses {
    return [self.numberOfRemainingGuesses intValue] == 0;
}

-(void) takeGuess:(NSArray*) guess {
    self.numberOfRemainingGuesses = [NSNumber numberWithInt: self.numberOfRemainingGuesses.intValue - 1];
    [self.guessResults addObject: [MMGuessResultImplementation resultFromCode: self.secretCode andGuess: guess]];
}

@end
