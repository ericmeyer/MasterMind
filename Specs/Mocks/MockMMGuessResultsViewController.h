#import <UIKit/UIKit.h>
#import "MMGuessResultsView.h"
#import "MMGuessResultImplementation.h"

@interface MockMMGuessResultsViewController : UIViewController<MMGuessResultsView>

@property (nonatomic, strong) MMGuessResultImplementation* addGuessResultCalldWith;
@property (readwrite, assign) BOOL wasResetCalled;

@end
