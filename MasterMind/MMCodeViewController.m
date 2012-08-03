#import "MMCodeViewController.h"
#import "MMCodePeg.h"
#import "ConciseKit.h"

@interface MMCodeViewController (private)
-(void) initEmptyPegs;
-(MMCodePeg*) emptyPeg;
@end

@implementation MMCodeViewController

@synthesize availablePegsController;
@synthesize pegs;

-(IBAction) touchPeg:(id) sender {
    MMCodePeg* touchedPeg = (MMCodePeg*) sender;
    [touchedPeg changeColor: self.availablePegsController.activePeg.color];
}

-(NSArray*) pegColors {
    return [self.pegs $map:^(id peg){
        return ((MMCodePeg*)peg).color;
    }];
}

-(BOOL) allPegsSet {
    MMCodePeg* unsetPeg = [self.pegs $detect:^BOOL(id peg){
        return ((MMCodePeg*)peg).color == NULL;  
    }];
    return (unsetPeg == NULL);
}

-(NSArray*) code {
    if ([self allPegsSet]) {
        return [self pegColors];
    } else {
        return NULL;
    }
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    MMCodePeg* emptyPeg = [MMCodePeg emptyPeg];
    [emptyPeg addTarget: self
                 action: @selector(touchPeg:)
       forControlEvents:UIControlEventTouchUpInside];
    return emptyPeg;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
