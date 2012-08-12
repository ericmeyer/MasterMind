#import "MMGuessResultsViewControllerImplementation.h"
#import "MMGuessResultViewController.h"

@implementation MMGuessResultsViewControllerImplementation

-(void) addGuessResult:(MMGuessResult*) guessResult {
    MMGuessResultViewController* guessResultViewController;
    guessResultViewController = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
    int offset = [self.guessResultViewControllers count] * 250;
    [self.guessResultViewControllers addObject: guessResultViewController];
    [guessResultViewController.view setFrame: CGRectMake(0, offset, 400, 250)];
    [self.view addSubview: guessResultViewController.view];
}

-(id) initWithNibName:(NSString*) nibNameOrNil bundle:(NSBundle*) nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.guessResultViewControllers = [NSMutableArray array];
    }
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
