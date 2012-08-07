#import "MMGuessResultsViewController.h"

@implementation MMGuessResultsViewController

@synthesize numberCorrectLabel, numberInWrongSpotLabel;

-(void) updateView:(NSObject<MMGame>*) game {
    self.numberCorrectLabel.text = [[[game lastGuessResult] numberCorrect] stringValue];
    self.numberInWrongSpotLabel.text = [[[game lastGuessResult] numberInWrongSpot] stringValue];
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
