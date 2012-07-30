#import "SecretCodeViewController.h"

@implementation SecretCodeViewController

@synthesize pegOne, pegTwo, availablePegsController;

-(void) touchPegOne {
    if (self.availablePegsController.activePeg != NULL) {
        self.pegOne = self.availablePegsController.activePeg;
    }
}

-(void) touchPegTwo {
    if (self.availablePegsController.activePeg != NULL) {
        self.pegTwo = self.availablePegsController.activePeg;
    }
}

@end
