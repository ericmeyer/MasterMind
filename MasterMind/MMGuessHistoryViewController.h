#import <Foundation/Foundation.h>
#import "MMGuessResult.h"

@protocol MMGuessHistoryViewController <NSObject>

-(void) addGuessResult:(MMGuessResult*) guessResult;

@end
