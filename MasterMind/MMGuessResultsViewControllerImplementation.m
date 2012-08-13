#import "MMGuessResultsViewControllerImplementation.h"
#import "MMGuessResultViewController.h"

@implementation MMGuessResultsViewControllerImplementation

-(void) addGuessResult:(MMGuessResultImplementation*) guessResult {
    MMGuessResultViewController* guessResultViewController;
    guessResultViewController = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
    int height = CGRectGetHeight(guessResultViewController.view.frame);
    int offset = [self.guessResultViewControllers count] * height;
    [self.guessResultViewControllers addObject: guessResultViewController];
    [guessResultViewController.view setFrame: CGRectMake(0, offset, 351, height)];
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
