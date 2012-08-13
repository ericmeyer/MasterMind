#import "MockMMGuessResultsViewController.h"

@implementation MockMMGuessResultsViewController

-(void) reset {
    self.wasResetCalled = YES;
}

-(void) addGuessResult:(MMGuessResultImplementation*) guessResult {
    self.addGuessResultCalldWith = guessResult;
}

@end
