#import <UIKit/UIKit.h>
#import "MMPegList.h"
#import "MMAvailableColorsViewController.h"

@interface MMPegListViewController : UIViewController<MMPegList> {
    MMAvailableColorsViewController* availableColorsController;
    NSMutableArray* pegs;
}
@property (nonatomic, strong) MMAvailableColorsViewController* availableColorsController;
@property (nonatomic, strong) NSMutableArray* pegs;

+(id) controllerWithAvailablePegsViewController:(MMAvailableColorsViewController*) givenAvailablePegsController;

-(IBAction) touchPeg:(id) sender;

@end
