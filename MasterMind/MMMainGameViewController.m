#import "MMMainGameViewController.h"
#import "MMGameImplementation.h"
#import "MMGuessResultsViewController.h"
#import "MMGuessHistoryViewController.h"
#import "MMPegListViewController.h"

@implementation MMMainGameViewController

@synthesize secretCodeViewController, guessViewController, availablePegsViewController;
@synthesize game, guessResultsViewController, guessHistoryViewController;

-(void) initializeControllers {
    self.availablePegsViewController = [MMAvailablePegsViewController new];
    self.guessViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availablePegsViewController];
    self.secretCodeViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availablePegsViewController];
    self.guessResultsViewController = [MMGuessResultsViewController new];
    self.guessHistoryViewController = [MMGuessHistoryViewController new];
}

-(void) resizeControllerViews {
    float availablePegsWidth = CGRectGetWidth(self.availablePegsViewController.view.frame);
    [self.secretCodeViewController.view setFrame: CGRectMake(availablePegsWidth, 0.0, 400.0, 96.0)];
    [self.guessViewController.view setFrame: CGRectMake(availablePegsWidth, 100, 400.0, 96.0)];
    [self.guessResultsViewController.view setFrame: CGRectMake(availablePegsWidth, 200, 425, 142)];
    [self.guessHistoryViewController.view setFrame: CGRectMake(availablePegsWidth+400, 0, 515, 748)];
}

-(void) addControllerSubviews{
    [self.view addSubview: self.guessResultsViewController.view];
    [self.view addSubview: self.availablePegsViewController.view];
    [self.view addSubview: self.secretCodeViewController.view];
    [self.view addSubview: self.guessViewController.view];
    [self.view addSubview: self.guessHistoryViewController.view];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self initializeControllers];
    [self resizeControllerViews];
    [self addControllerSubviews];
}

-(IBAction) startNewGame {
    self.game = [MMGameImplementation gameWithCode: self.secretCodeViewController.pegList];
    [self.guessResultsViewController updateView: self.game];
}

-(IBAction) takeGuess {
    [self.game takeGuess: self.guessViewController.pegList];
    [self.guessResultsViewController updateView: self.game];
    [self.guessHistoryViewController updateView: self.game];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationLandscapeLeft && interfaceOrientation != UIInterfaceOrientationLandscapeRight);
    } else {
        return YES;
    }
}

@end
