#import "MMAvailablePegsViewController.h"
#import "MMAvailablePeg.h"

@interface MMAvailablePegsViewController ()

@end

@implementation MMAvailablePegsViewController

@synthesize activePeg, activePegLabel, availablePegs;

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

-(IBAction) setPegActive:(id) sender {
    NSLog(@"sender: %@", sender);
//    [self.activePeg deactivate];
//    [clickedPeg activate];
//    self.activePeg = clickedPeg;
}

- (void)initAvailablePegs
{
    self.availablePegs = [NSArray arrayWithObjects:
                          [MMAvailablePeg pegWithColor: @"red"],
                          [MMAvailablePeg pegWithColor: @"blue"],
                          [MMAvailablePeg pegWithColor: @"orange"],
                          [MMAvailablePeg pegWithColor: @"yellow"],
                          nil];
    for (MMAvailablePeg* availablePeg in self.availablePegs) {
        [availablePeg addTarget: self
                         action: @selector(setPegActive:)
               forControlEvents: UIControlEventTouchUpInside];
    }
}

- (void)displayAvailablePegs
{
    for (int i=0; i<[self.availablePegs count]; i++) {
        MMAvailablePeg* availablePeg = [self.availablePegs objectAtIndex: i];
        availablePeg.frame = CGRectMake(0, i*90.0, 90, 90);
        [self.view addSubview: availablePeg];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initAvailablePegs];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayAvailablePegs];
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
