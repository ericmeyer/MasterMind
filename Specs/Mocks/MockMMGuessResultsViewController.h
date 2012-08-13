#import <UIKit/UIKit.h>
#import "MMGuessResultsView.h"
#import "MMGuessResult.h"

@interface MockMMGuessResultsViewController : UIViewController<MMGuessResultsView>

@property (nonatomic, strong) NSObject<MMGuessResult>* addGuessResultCalldWith;
@property (readwrite, assign) BOOL wasResetCalled;

@end
