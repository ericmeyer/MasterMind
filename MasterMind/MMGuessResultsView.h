#import <Foundation/Foundation.h>
#import "MMGuessResultImplementation.h"

@protocol MMGuessResultsView <NSObject>

-(void) addGuessResult:(MMGuessResultImplementation*) guessResult;

@end
