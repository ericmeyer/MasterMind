#import <UIKit/UIKit.h>
#import "MMViewWithGame.h"

@interface MMGuessResultsViewController : UIViewController<MMViewWithGame> {
    IBOutlet UILabel* numberCorrectLabel;
    IBOutlet UILabel* numberInWrongSpotLabel;
    IBOutlet UILabel* remainingGuessesLabel;
}
@property(nonatomic, strong) UILabel* numberCorrectLabel;
@property(nonatomic, strong) UILabel* numberInWrongSpotLabel;
@property(nonatomic, strong) UILabel* remainingGuessesLabel;

@end
