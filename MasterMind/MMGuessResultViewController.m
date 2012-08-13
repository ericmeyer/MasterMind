#import "MMGuessResultViewController.h"
#import "MMCodePeg.h"
#import "ConciseKit.h"

@implementation MMGuessResultViewController

-(id) initWithGuessResult:(NSObject<MMGuessResult>*) givenGuessResult {
    if ((self = [super initWithNibName:@"MMGuessResultViewController" bundle:nil])) {
        self.guessResult = givenGuessResult;
    }
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.numberCorrectLabel.text = [[self.guessResult numberCorrect] stringValue];
    self.numberInWrongSpotLabel.text = [[self.guessResult numberInWrongSpot] stringValue];
    [self initializePegs];
    [self addPegSubviews];
}

-(void) initializePegs {
    self.pegs = [NSMutableArray array];
    [self.guessResult.guess $eachWithIndex:^(id color, NSUInteger i) {
        MMCodePeg* peg = [MMCodePeg pegWithColorName: (NSString*)color];
        peg.enabled = NO;
        [self.pegs addObject: peg];
    }];
}

-(void) addPegSubviews {
    [self.pegs $eachWithIndex:^(id obj, NSUInteger i) {
        MMCodePeg* peg = (MMCodePeg*)obj;
        peg.frame = CGRectMake(i*(PEG_SIDE_LENGTH+1), 0, PEG_SIDE_LENGTH, PEG_SIDE_LENGTH);
        [self.view addSubview: peg];
        
    }];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
