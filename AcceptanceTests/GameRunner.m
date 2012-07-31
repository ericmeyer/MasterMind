#import "GameRunner.h"

@implementation GameRunner

@synthesize game;

-(void) startNewGame {
    self.game = [MMGame new];
}

-(NSNumber*) remainingGuesses {
    return game.numberOfRemainingGuesses;
}

-(NSString*) gameOver {
    if ([game isOver]) {
        return @"true";
    } else {
        return @"false";
    }
}

-(NSString*) didWin {
    if ([game didWin]) {
        return @"true";
    } else {
        return @"false";
    }
}

@end
