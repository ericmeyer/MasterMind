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
    [self initializeGuessPegs];
    [self addGuessPegSubviews];
    [self initializeResultPegs];
    [self addResultPegSubviews];
}

-(void) initializeGuessPegs {
    self.pegs = [NSMutableArray array];
    [self.guessResult.guess $eachWithIndex:^(id color, NSUInteger i) {
        MMCodePeg* peg = [MMCodePeg pegWithColorName: (NSString*)color];
        peg.enabled = NO;
        [self.pegs addObject: peg];
    }];
}

-(void) addGuessPegSubviews {
    [self.pegs $eachWithIndex:^(id obj, NSUInteger i) {
        MMCodePeg* peg = (MMCodePeg*)obj;
        peg.frame = CGRectMake(i*(PEG_SIDE_LENGTH+1), 0, PEG_SIDE_LENGTH, PEG_SIDE_LENGTH);
        [self.view addSubview: peg];
        
    }];
}

-(void) initializeResultPegs {
    self.resultPegs = [NSMutableArray array];
    for (int i=0; i<[[self.guessResult numberCorrect] intValue]; i++) {
        [self.resultPegs addObject: [self correctResultPeg]];
    }
    for (int i=0; i<[[self.guessResult numberInWrongSpot] intValue]; i++) {
        [self.resultPegs addObject: [self wrongSpotResultPeg]];
    }
}

-(void) addResultPegSubviews {
    [self.resultPegs $eachWithIndex:^(id obj, NSUInteger i) {
        UIImageView* resultPeg = (UIImageView*)obj;
        resultPeg.frame = CGRectMake(i%2*24+292+(i%2)*6, 6+i/2*24+(i/2)*6, 24, 24);
        [self.view addSubview: resultPeg];
    }];
}

-(UIImageView*) correctResultPeg{
    return [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"peg_in_correct_spot.png"]];

}

-(UIImageView*) wrongSpotResultPeg{
    return [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"peg_in_wrong_spot.png"]];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
