#import "MockMMGuessHistoryViewController.h"

@implementation MockMMGuessHistoryViewController

-(void) addGuessResult:(MMGuessResult*) guessResult {
    self.addGuessResultCalldWith = guessResult;
}

@end
