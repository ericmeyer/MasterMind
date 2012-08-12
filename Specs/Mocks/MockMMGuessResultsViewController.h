#import <UIKit/UIKit.h>
#import "MMGuessResultsView.h"
#import "MMGuessResultImplementation.h"

@interface MockMMGuessResultsViewController : UIViewController<MMGuessResultsView>

@property (readwrite, assign) MMGuessResultImplementation* addGuessResultCalldWith;

@end
