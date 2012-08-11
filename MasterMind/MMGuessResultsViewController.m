#import "MMGuessResultsViewController.h"

@implementation MMGuessResultsViewController

@synthesize numberCorrectLabel, numberInWrongSpotLabel, remainingGuessesLabel;

-(id) initWithGuessResult:(MMGuessResult*) givenGuessResult {
    if ((self = [super initWithNibName:@"MMGuessResultsViewController" bundle:nil])) {
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
