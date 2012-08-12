#import "MMGuessResultViewController.h"

@implementation MMGuessResultViewController

-(id) initWithGuessResult:(MMGuessResultImplementation*) givenGuessResult {
    if ((self = [super initWithNibName:@"MMGuessResultViewController" bundle:nil])) {
        self.guessResult = givenGuessResult;
    }
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.numberCorrectLabel.text = [[self.guessResult numberCorrect] stringValue];
    self.numberInWrongSpotLabel.text = [[self.guessResult numberInWrongSpot] stringValue];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
