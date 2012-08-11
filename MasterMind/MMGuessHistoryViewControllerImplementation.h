#import <UIKit/UIKit.h>
#import "MMGuessHistoryViewController.h"

@interface MMGuessHistoryViewControllerImplementation : UIViewController<MMGuessHistoryViewController> {
    NSMutableArray* guessResultViewControllers;
}

@property (nonatomic, strong) NSMutableArray* guessResultViewControllers;

@end
