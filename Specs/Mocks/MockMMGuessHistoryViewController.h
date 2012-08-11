#import <UIKit/UIKit.h>
#import "MMGuessHistoryViewController.h"
#import "MMGuessResult.h"

@interface MockMMGuessHistoryViewController : UIViewController<MMGuessHistoryViewController>

@property (readwrite, assign) MMGuessResult* addGuessResultCalldWith;

@end
