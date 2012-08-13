#import "MMGuessResultsViewControllerImplementation.h"
#import "MMGuessResultViewController.h"
#import "ConciseKit.h"

@implementation MMGuessResultsViewControllerImplementation

-(void) reset {
    [self.guessResultViewControllers $each:^(id controller) {
        [((MMGuessResultViewController*)controller).view removeFromSuperview];
    }];
    self.guessResultViewControllers = [NSMutableArray array];
}

-(void) addGuessResult:(MMGuessResultImplementation*) guessResult {
    MMGuessResultViewController* guessResultViewController;
    guessResultViewController = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];

    [guessResultViewController.view setFrame: [self adjustedFrame: guessResultViewController.view.frame]];
    [self.guessResultViewControllers addObject: guessResultViewController];
    [self.view addSubview: guessResultViewController.view];
}

-(CGRect) adjustedFrame:(CGRect) originalFrame {
    int height = CGRectGetHeight(originalFrame);
    int offset = [self.guessResultViewControllers count] * height;
    int width = CGRectGetWidth(originalFrame);
    return CGRectMake(0, offset, width, height);
}

-(id) initWithNibName:(NSString*) nibNameOrNil bundle:(NSBundle*) nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.guessResultViewControllers = [NSMutableArray array];
    }
    return self;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
