#import "MMPegListViewController.h"
#import "MMCodePeg.h"
#import "ConciseKit.h"

@interface MMPegListViewController (private)
-(void) initEmptyPegs;
-(MMCodePeg*) emptyPegWithTarget;
@end

@implementation MMPegListViewController

+(id) controllerWithAvailablePegsViewController:(MMAvailableColorsViewController*) givenAvailablePegsController {
    MMPegListViewController* controller;
    controller = [[MMPegListViewController alloc] initWithNibName: @"MMPegListViewController"
                                                           bundle: nil];
    controller.availableColorsController = givenAvailablePegsController;
    return controller;
}

-(IBAction) touchPeg:(id) sender {
    MMCodePeg* touchedPeg = (MMCodePeg*) sender;
    if (self.availableColorsController.activeColor.name) {
        [touchedPeg changeColor: self.availableColorsController.activeColor.name];
    }
}

-(NSArray*) pegColors {
    return [self.pegs $map:^(id peg){
        return ((MMCodePeg*)peg).color;
    }];
}

-(BOOL) allPegsAreSet {
    MMCodePeg* unsetPeg = [self.pegs $detect:^BOOL(id peg){
        return ((MMCodePeg*)peg).color == NULL;
    }];
    return (unsetPeg == NULL);
}

-(NSArray*) pegList {
    if ([self allPegsAreSet]) {
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
        emptyPeg.frame = CGRectMake(i*PEG_SIDE_LENGTH, 0, PEG_SIDE_LENGTH, PEG_SIDE_LENGTH);
        [self.view addSubview: emptyPeg];
    }];
}

-(void) initEmptyPegs {
    self.pegs = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        [self.pegs addObject: [self emptyPegWithTarget]];
    }
}

-(MMCodePeg*) emptyPegWithTarget {
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
