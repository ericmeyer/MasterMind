#import <UIKit/UIKit.h>
#import "MMAvailablePegsViewController.h"

@interface MMPegListViewController : UIViewController {
    MMAvailablePegsViewController* availablePegsController;
    NSMutableArray* pegs;
}
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsController;
@property (nonatomic, retain) NSMutableArray* pegs;

+(id) controllerWithAvailablePegsViewController:(MMAvailablePegsViewController*) givenAvailablePegsController;

-(IBAction) touchPeg:(id) sender;

-(NSArray*) pegList;

@end
