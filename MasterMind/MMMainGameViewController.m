#import "MMMainGameViewController.h"
#import "MMGameImplementation.h"
#import "MMGuessResultsViewController.h"
#import "MMPegListViewController.h"

@implementation MMMainGameViewController

@synthesize secretCodeViewController, guessViewController, availablePegsViewController;
@synthesize game, guessResultsViewController;

-(void) initializeControllers {
    self.availablePegsViewController = [MMAvailablePegsViewController new];
    self.guessViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availablePegsViewController];
    self.secretCodeViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availablePegsViewController];
    self.guessResultsViewController = [MMGuessResultsViewController new];
}

-(void) resizeControllerViews {
    float availablePegsWidth = CGRectGetWidth(self.availablePegsViewController.view.frame);
    [self.secretCodeViewController.view setFrame: CGRectMake(availablePegsWidth, 0.0, 400.0, 96.0)];
    [self.guessViewController.view setFrame: CGRectMake(availablePegsWidth, 100, 400.0, 96.0)];
    [self.guessResultsViewController.view setFrame: CGRectMake(availablePegsWidth, 200, 425, 142)];
}

-(void) addControllerSubviews{
    [self.view addSubview: self.guessResultsViewController.view];
    [self.view addSubview: self.availablePegsViewController.view];
    [self.view addSubview: self.secretCodeViewController.view];
    [self.view addSubview: self.guessViewController.view];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self initializeControllers];
    [self resizeControllerViews];
    [self addControllerSubviews];
}

-(IBAction) startNewGame {
    self.game = [MMGameImplementation gameWithCode: self.secretCodeViewController.pegList];
    [self.guessResultsViewController updateView: game];
}

-(IBAction) takeGuess {
    [self.game takeGuess: self.guessViewController.pegList];
    [self.guessResultsViewController updateView: game];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationLandscapeLeft && interfaceOrientation != UIInterfaceOrientationLandscapeRight);
    } else {
        return YES;
    }
}

@end
