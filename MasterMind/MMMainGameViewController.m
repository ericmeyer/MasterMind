#import "MMMainGameViewController.h"
#import "MMGameImplementation.h"
#import "MMGuessResultViewController.h"
#import "MMGuessResultsViewControllerImplementation.h"
#import "MMPegListViewController.h"

@implementation MMMainGameViewController

-(void) initializeControllers {
    self.availableColorsViewController = [MMAvailableColorsViewController new];
    self.guessViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availableColorsViewController];
    self.secretCodeViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availableColorsViewController];
    self.guessResultsViewController = [MMGuessResultsViewControllerImplementation new];
}

-(void) resizeControllerViews {
    [self.availableColorsViewController.view setFrame: CGRectMake(50, 110, PEG_SIDE_LENGTH*3+30, PEG_SIDE_LENGTH*2+15)];
    [self.secretCodeViewController.view setFrame: CGRectMake(50, 345, PEG_SIDE_LENGTH*4, PEG_SIDE_LENGTH)];
    [self.guessViewController.view setFrame: CGRectMake(50, 572, PEG_SIDE_LENGTH*4, PEG_SIDE_LENGTH)];
    [self.guessResultsViewController.view setFrame: CGRectMake(350, 40, 351, 934)];
}

-(void) addControllerSubviews{
    [self.view addSubview: self.availableColorsViewController.view];
    [self.view addSubview: self.secretCodeViewController.view];
    [self.view addSubview: self.guessResultsViewController.view];
    [self.view addSubview: self.guessViewController.view];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self setFonts];
    [self initializeControllers];
    [self resizeControllerViews];
    [self addControllerSubviews];
}

-(void) setFonts {
    UIFont* robotoThin = [UIFont fontWithName: @"Roboto-Thin" size: 48.0];
    [self.bankLabel setFont: robotoThin];
    [self.codeLabel setFont: robotoThin];
    [self.guessLabel setFont: robotoThin];
    [self.gameButton.titleLabel setFont: robotoThin];
    [self.guessButton.titleLabel setFont: robotoThin];
}

-(IBAction) startNewGame {
    self.game = [MMGameImplementation gameWithCode: self.secretCodeViewController.pegList];
}

-(IBAction) takeGuess {
    [self.game takeGuess: self.guessViewController.pegList];
    [self.guessResultsViewController addGuessResult: [[self.game guessResults] lastObject]];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return YES;
    }
}

@end
