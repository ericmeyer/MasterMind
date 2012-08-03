#import "MMSecretCodeViewController.h"
#import "MMCodePeg.h"
#import "ConciseKit.h"

@interface MMSecretCodeViewController (private)
-(void) initEmptyPegs;
-(MMCodePeg*) emptyPeg;
@end

@implementation MMSecretCodeViewController

@synthesize availablePegsController;
@synthesize pegs;

-(IBAction) touchPeg:(id) sender {
    MMCodePeg* touchedPeg = (MMCodePeg*) sender;
    [touchedPeg changeColor: self.availablePegsController.activePeg.color];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initEmptyPegs];
    }
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self.pegs $eachWithIndex:^(id obj, NSUInteger i) {
        MMCodePeg* emptyPeg = (MMCodePeg*)obj;
        emptyPeg.frame = CGRectMake(i*100, 0, 90, 90);
        [self.view addSubview: emptyPeg];
    }];
}

-(void) initEmptyPegs {
    self.pegs = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        [self.pegs addObject: [self emptyPeg]];
    }
}

-(MMCodePeg*) emptyPeg {
    MMCodePeg* emptyPeg = [MMCodePeg pegWithColor: @"red"];
    [emptyPeg addTarget: self
                 action: @selector(touchPeg:)
       forControlEvents:UIControlEventTouchUpInside];
    return emptyPeg;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
