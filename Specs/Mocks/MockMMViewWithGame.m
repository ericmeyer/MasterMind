#import "MockMMViewWithGame.h"

@implementation MockMMViewWithGame

@synthesize updateViewCalledWith;

-(void) updateView:(NSObject<MMGame>*) game {
    self.updateViewCalledWith = game;
}

@end
