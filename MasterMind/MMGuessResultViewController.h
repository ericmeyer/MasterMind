#import <UIKit/UIKit.h>
#import "MMGuessResultImplementation.h"

@interface MMGuessResultViewController : UIViewController

@property(nonatomic, strong) MMGuessResultImplementation* guessResult;

@property(nonatomic, strong) UILabel* numberCorrectLabel;
@property(nonatomic, strong) UILabel* numberInWrongSpotLabel;

-(id) initWithGuessResult:(MMGuessResultImplementation*) givenGuessResult;

@end
