#import "MMSecretCodeViewController.h"

@interface MMSecretCodeViewController ()

@end

@implementation MMSecretCodeViewController

@synthesize pegOne, pegTwo, availablePegsController;

-(IBAction) touchPegOne {
    if (self.availablePegsController.activePegString != NULL) {
        self.pegOne.titleLabel.text = self.availablePegsController.activePegString;
    }
}

-(IBAction) touchPegTwo {
    if (self.availablePegsController.activePegString != NULL) {
        self.pegTwo.titleLabel.text = self.availablePegsController.activePegString;
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
