#import "MMAvailableColorsViewController.h"
#import "MMCodePeg.h"
#import "MMAvailableColor.h"
#import "ConciseKit.h"

@implementation MMAvailableColorsViewController

@synthesize availableColors, activeColor;

-(IBAction) clickPeg:(id) sender {
    MMAvailableColor* clickedButton = ((MMAvailableColor*)sender);
    [self.activeColor deactivate];
    if (self.activeColor == clickedButton) {
        [self setActiveColor: NULL];
    } else {
        [self setActiveColor: clickedButton];
        [self.activeColor activate];
    }
}

- (void)initAvailablePegs
{
    NSArray* colors = $arr(@"red", @"orange", @"yellow", @"green", @"blue", @"purple");
    self.availableColors = [NSMutableArray array];
    for (NSString* color in colors) {
        MMAvailableColor* availableColor = [MMAvailableColor colorWithName: color];
        [availableColor addTarget: self
                         action: @selector(clickPeg:)
               forControlEvents: UIControlEventTouchUpInside];
        [self.availableColors addObject: availableColor];
    }
}

-(void) displayAvailablePegs
{
    for (int i=0; i<[self.availableColors count]; i++) {
        MMCodePeg* availablePeg = [self.availableColors objectAtIndex: i];
        availablePeg.frame = CGRectMake(i%3*PEG_SIDE_LENGTH+(i%3)*15, i/3*PEG_SIDE_LENGTH+(i/3)*15, PEG_SIDE_LENGTH, PEG_SIDE_LENGTH);
        [self.view addSubview: availablePeg];
    }
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self initAvailablePegs];
    [self displayAvailablePegs];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
	return NO;
}

@end
