#import <UIKit/UIKit.h>
#import "MMViewWithGame.h"

@interface MMGuessResultsViewController : UIViewController<MMViewWithGame> {
    IBOutlet UILabel* numberCorrectLabel;
    IBOutlet UILabel* numberInWrongSpotLabel;
}
@property(nonatomic, strong) UILabel* numberCorrectLabel;
@property(nonatomic, strong) UILabel* numberInWrongSpotLabel;

@end
