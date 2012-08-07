#import <UIKit/UIKit.h>
#import "MMPegList.h"
#import "MMAvailablePegsViewController.h"

@interface MMPegListViewController : UIViewController<MMPegList> {
    MMAvailablePegsViewController* availablePegsController;
    NSMutableArray* pegs;
}
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsController;
@property (nonatomic, retain) NSMutableArray* pegs;

+(id) controllerWithAvailablePegsViewController:(MMAvailablePegsViewController*) givenAvailablePegsController;

-(IBAction) touchPeg:(id) sender;

@end
