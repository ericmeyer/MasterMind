#import "MMGuessResultsViewController.h"

@implementation MMGuessResultsViewController

@synthesize numberCorrectLabel, numberInWrongSpotLabel, remainingGuessesLabel;

-(void) updateView:(NSObject<MMGame>*) game {
    self.numberCorrectLabel.text = [[[[game guessResults] lastObject] numberCorrect] stringValue];
    self.numberInWrongSpotLabel.text = [[[[game guessResults] lastObject] numberInWrongSpot] stringValue];
    self.remainingGuessesLabel.text = [[game numberOfRemainingGuesses] stringValue];
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
