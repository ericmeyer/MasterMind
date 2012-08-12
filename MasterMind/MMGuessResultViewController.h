#import <UIKit/UIKit.h>
#import "MMGuessResult.h"

@interface MMGuessResultViewController : UIViewController

@property(nonatomic, strong) UILabel* numberCorrectLabel;
@property(nonatomic, strong) UILabel* numberInWrongSpotLabel;
@property(nonatomic, strong) UILabel* remainingGuessesLabel;
@property(nonatomic, strong) MMGuessResult* guessResult;

-(id) initWithGuessResult:(MMGuessResult*) givenGuessResult;

@end
