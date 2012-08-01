#import "MMAvailablePegsViewController.h"
#import "MMAvailablePeg.h"
#import "ConciseKit.h"

@interface MMAvailablePegsViewController ()

@end

@implementation MMAvailablePegsViewController

@synthesize activePegString, activePegLabel, availablePegs, activePeg;

-(IBAction) clickPeg:(id) sender {
    MMAvailablePeg* clickedButton = ((MMAvailablePeg*)sender);
    [self.activePeg deactivate];
    if (self.activePeg == clickedButton) {
        [self setActivePeg: NULL];
    } else {
        [self setActivePeg: clickedButton];
        [self.activePeg activate];
    }
    self.activePegLabel.text = self.activePeg.color;
}

- (void)initAvailablePegs
{
    NSArray* colors = $arr(@"red", @"blue", @"orange", @"yellow");
    self.availablePegs = [NSMutableArray array];
    for (NSString* color in colors) {
        MMAvailablePeg* availablePeg = [MMAvailablePeg pegWithColor: color];
        [availablePeg addTarget: self
                         action: @selector(clickPeg:)
               forControlEvents: UIControlEventTouchUpInside];
        [self.availablePegs addObject: availablePeg];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}

@end
