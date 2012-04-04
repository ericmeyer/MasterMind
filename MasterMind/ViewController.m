#import "ViewController.h"

@implementation ViewController

@synthesize numberCorrect, numberInWrongSpot, secretCode, guess;

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
    [self setInitialGuessResults];
    [self setInitialSecretCode];
    [self setInitialGuess];
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
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
