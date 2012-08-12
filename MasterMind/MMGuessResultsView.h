#import <Foundation/Foundation.h>
#import "MMGuessResult.h"

@protocol MMGuessResultsView <NSObject>

-(void) addGuessResult:(MMGuessResult*) guessResult;

@end
