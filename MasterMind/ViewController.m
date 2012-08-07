#import "ViewController.h"
#import "MMGameImplementation.h"
#import "MMGuessResultsViewController.h"

@implementation ViewController

@synthesize secretCodeViewController, guessViewController, availablePegsViewController;
@synthesize game, guessResultsViewController;

#pragma mark - View lifecycle

-(void) viewDidLoad {
    [super viewDidLoad];
    
    self.game = [MMGameImplementation new];
    self.availablePegsViewController = [[MMAvailablePegsViewController alloc] initWithNibName: @"MMAvailablePegsViewController"
                                                                                       bundle: nil];    
    self.guessViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availablePegsViewController];
    self.secretCodeViewController = [MMPegListViewController controllerWithAvailablePegsViewController: self.availablePegsViewController];
    
    float availablePegsWidth = CGRectGetWidth(self.availablePegsViewController.view.frame);
    [self.secretCodeViewController.view setFrame: CGRectMake(availablePegsWidth, 0.0, 400.0, 96.0)];

    [self.guessViewController.view setFrame: CGRectMake(availablePegsWidth, 100, 400.0, 96.0)];
    
    self.guessResultsViewController = [[MMGuessResultsViewController alloc] initWithNibName: @"MMGuessResultsViewController"
                                                                                     bundle: nil];
    
    [self.guessResultsViewController.view setFrame: CGRectMake(availablePegsWidth, 200, 425, 142)];
    
    [self.view addSubview: self.guessResultsViewController.view];
    [self.view addSubview: self.availablePegsViewController.view];
    [self.view addSubview: self.secretCodeViewController.view];
    [self.view addSubview: self.guessViewController.view];
}

-(IBAction) setCode {
    self.game.secretCode = self.secretCodeViewController.pegList;
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
