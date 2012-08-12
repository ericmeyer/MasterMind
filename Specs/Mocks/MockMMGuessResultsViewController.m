#import "MockMMGuessResultsViewController.h"

@implementation MockMMGuessResultsViewController

-(void) addGuessResult:(MMGuessResult*) guessResult {
    self.addGuessResultCalldWith = guessResult;
}

@end
