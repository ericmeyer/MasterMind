#import <UIKit/UIKit.h>
#import "MMGuessResult.h"

@interface MMGuessResultViewController : UIViewController

@property(nonatomic, strong) NSObject<MMGuessResult>* guessResult;

@property(nonatomic, strong) UILabel* numberCorrectLabel;
@property(nonatomic, strong) UILabel* numberInWrongSpotLabel;

-(id) initWithGuessResult:(NSObject<MMGuessResult>*) givenGuessResult;

@end
