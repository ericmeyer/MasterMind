#import <UIKit/UIKit.h>
#import "MMGuessResult.h"

@interface MMGuessResultsViewController : UIViewController {
    IBOutlet UILabel* numberCorrectLabel;
    IBOutlet UILabel* numberInWrongSpotLabel;
    IBOutlet UILabel* remainingGuessesLabel;
    MMGuessResult* guessResult;
}
@property(nonatomic, strong) UILabel* numberCorrectLabel;
@property(nonatomic, strong) UILabel* numberInWrongSpotLabel;
@property(nonatomic, strong) UILabel* remainingGuessesLabel;
@property(nonatomic, strong) MMGuessResult* guessResult;

-(id) initWithGuessResult:(MMGuessResult*) givenGuessResult;

@end
