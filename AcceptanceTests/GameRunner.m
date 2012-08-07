#import "GameRunner.h"
#import "ConciseKit.h"

@implementation GameRunner

@synthesize game;

-(void) startNewGameWithCode: (NSString*) givenSecretCode {
    self.game = [MMGameImplementation gameWithCode: [givenSecretCode $chars]];
}

-(void) startNewGame {
    self.game = [MMGameImplementation new];
}

-(void) setSecretCodeTo:(NSString*) secretCodeAsString {
    self.game.secretCode = [secretCodeAsString $chars];
}

-(NSString*) secretCode {
    return [self.game.secretCode $join];
}

-(void) takeGuess:(NSString*) guessAsString {
    [self.game takeGuess: [guessAsString $chars]];
}

-(NSNumber*) lastGuessNumberCorrect {
    return [[game lastGuessResult] numberCorrect];
}

-(NSNumber*) lastGuessNumberInWrongSpot {
    return [[game lastGuessResult] numberInWrongSpot];
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
