#import "GameRunner.h"
#import "MMGuessResult.h"
#import "ConciseKit.h"

@implementation GameRunner

@synthesize game;

-(void) startNewGameWithCode: (NSString*) givenSecretCode {
    self.game = [MMGameImplementation gameWithCode: [givenSecretCode $chars]];
}

-(NSString*) secretCode {
    return [self.game.secretCode $join];
}

-(void) takeGuess:(NSString*) guessAsString {
    [self.game takeGuess: [guessAsString $chars]];
}

-(NSNumber*) lastGuessNumberCorrect {
    return [[[game guessResults] lastObject] numberCorrect];
}

-(NSNumber*) lastGuessNumberInWrongSpot {
    return [[[game guessResults] lastObject] numberInWrongSpot];
}

-(NSString*) guessIs:(NSString*) position {
    int index = [position intValue] - 1;
    return [[[[game guessResults] objectAtIndex: index] guess] $join];
}

-(NSNumber*) guessNumberCorrectIs:(NSString*) position {
    int index = [position intValue] - 1;
    return [[[game guessResults] objectAtIndex: index] numberCorrect];
}

-(NSNumber*) guessNumberInWrongSpotIs:(NSString*) position {
    int index = [position intValue] - 1;
    return [[[game guessResults] objectAtIndex: index] numberInWrongSpot];
}

-(void) setRemainingGuessesTo:(NSString*) remainingGuesses {
    game.numberOfRemainingGuesses = [NSNumber numberWithInt: [remainingGuesses intValue]];
}

-(NSNumber*) remainingGuesses {
    return [game numberOfRemainingGuesses];
}

-(BOOL) gameIsOver {
    return [game isOver];
}

-(BOOL) playerDidWin {
    return [game didWin];
}

@end
