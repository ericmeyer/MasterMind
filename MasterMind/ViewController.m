#import "ViewController.h"
#import "MMCode.h"

@implementation ViewController

@synthesize numberCorrect, numberInWrongSpot, secretCode, guess;
@synthesize secretCodeViewController, secretCodeView, availablePegsViewController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)setInitialGuessResults
{
    self.numberCorrect.text = @"";
    self.numberInWrongSpot.text = @"";
}

- (void)setInitialSecretCode
{
    self.secretCode.text = @"YGRB";
}

- (void)setInitialGuess
{
    self.guess.text = @"GGGG";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.secretCodeViewController = [[MMSecretCodeViewController alloc] initWithNibName: @"MMSecretCodeViewController"
                                                                                 bundle: nil];
    self.availablePegsViewController = [[MMAvailablePegsViewController alloc] initWithNibName: @"MMAvailablePegsViewController"
                                                                                       bundle: nil];
//    self.secretCodeView = self.secretCodeViewController.view;
    float availablePegsWidth = CGRectGetWidth(self.availablePegsViewController.view.frame);
    [self.secretCodeViewController.view setFrame: CGRectMake(availablePegsWidth, 0.0, 400.0, 96.0)];
    [self.view addSubview: self.availablePegsViewController.view];
    [self.view addSubview: self.secretCodeViewController.view];
    [self setInitialGuessResults];
    [self setInitialSecretCode];
    [self setInitialGuess];
}

-(IBAction) takeGuess
{
    MMCode* mmCode = [[MMCode alloc] init];
    self.numberCorrect.text = [[mmCode numberCorrectForCode: self.secretCode.text
                                                   andGuess: self.guess.text] stringValue];
    self.numberInWrongSpot.text = [[mmCode numberInWrongSpotForCode: self.secretCode.text
                                                           andGuess: self.guess.text] stringValue];
    [mmCode release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationLandscapeLeft && interfaceOrientation != UIInterfaceOrientationLandscapeRight);
    } else {
        return YES;
    }
}

@end
