#import "GameRunner.h"

@implementation GameRunner

@synthesize game;

-(void) startNewGame {
    self.game = [MMGame new];
}

-(NSNumber*) remainingGuesses {
    return game.numberOfRemainingGuesses;
}

-(BOOL) gameIsOver {
    return [game isOver];
}

-(BOOL) playerDidWin {
    return [game didWin];
}

@end
