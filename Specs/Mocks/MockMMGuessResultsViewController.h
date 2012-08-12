#import <UIKit/UIKit.h>
#import "MMGuessResultsView.h"
#import "MMGuessResult.h"

@interface MockMMGuessResultsViewController : UIViewController<MMGuessResultsView>

@property (readwrite, assign) MMGuessResult* addGuessResultCalldWith;

@end
