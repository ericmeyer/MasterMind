#import <UIKit/UIKit.h>
#import "MMGuessResult.h"

@interface MMGuessResultViewController : UIViewController

@property(nonatomic, strong) NSObject<MMGuessResult>* guessResult;

@property(nonatomic, strong) NSMutableArray* pegs;
@property(nonatomic, strong) NSMutableArray* resultPegs;

-(id) initWithGuessResult:(NSObject<MMGuessResult>*) givenGuessResult;

@end
