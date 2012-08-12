#import "MockMMGuessResultsViewController.h"

@implementation MockMMGuessResultsViewController

-(void) addGuessResult:(MMGuessResultImplementation*) guessResult {
    self.addGuessResultCalldWith = guessResult;
}

@end
