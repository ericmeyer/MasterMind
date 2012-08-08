#import <UIKit/UIKit.h>
#import "MMPegList.h"
#import "MMAvailablePegsViewController.h"

@interface MMPegListViewController : UIViewController<MMPegList> {
    MMAvailablePegsViewController* availablePegsController;
    NSMutableArray* pegs;
}
@property (nonatomic, strong) MMAvailablePegsViewController* availablePegsController;
@property (nonatomic, strong) NSMutableArray* pegs;

+(id) controllerWithAvailablePegsViewController:(MMAvailablePegsViewController*) givenAvailablePegsController;

-(IBAction) touchPeg:(id) sender;

@end
