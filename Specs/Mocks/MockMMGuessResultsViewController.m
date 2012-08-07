#import "MockMMGuessResultsViewController.h"

@implementation MockMMGuessResultsViewController

@synthesize updateViewCalledWith;

-(void) updateView:(NSObject<MMGame>*) game {
    self.updateViewCalledWith = game;
}

@end
