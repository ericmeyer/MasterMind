#import "MockMMGuessResultsViewController.h"
#import "MMGuessResult.h"

@implementation MockMMGuessResultsViewController

-(void) reset {
    self.wasResetCalled = YES;
}

-(void) addGuessResult:(NSObject<MMGuessResult>*) guessResult {
    self.addGuessResultCalldWith = guessResult;
}

@end
