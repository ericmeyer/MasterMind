#import <UIKit/UIKit.h>
#import "MMGuessResultsView.h"

@interface MMGuessResultsViewControllerImplementation : UIViewController<MMGuessResultsView> {
    NSMutableArray* guessResultViewControllers;
}

@property (nonatomic, strong) NSMutableArray* guessResultViewControllers;

@end
