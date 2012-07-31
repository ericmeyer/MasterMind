#import "MMAvailablePegsViewController.h"

@interface MMAvailablePegsViewController ()

@end

@implementation MMAvailablePegsViewController

@synthesize activePeg, activePegLabel;

-(IBAction) clickPeg:(id) sender {
    UIButton* clickedButton = ((UIButton*)sender);
    NSString* clickedPeg = [NSString stringWithFormat: @"%d", clickedButton.tag];
    if ([activePeg isEqualToString: clickedPeg]) {
        self.activePeg = NULL;
        self.activePegLabel.text = NULL;
        clickedButton.backgroundColor = [UIColor blueColor];
    } else {
        self.activePeg = clickedPeg;
        self.activePegLabel.text = clickedPeg;
        clickedButton.backgroundColor = [UIColor whiteColor];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
