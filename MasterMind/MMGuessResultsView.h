#import <Foundation/Foundation.h>
#import "MMGuessResultImplementation.h"

@protocol MMGuessResultsView <NSObject>

-(void) reset;
-(void) addGuessResult:(MMGuessResultImplementation*) guessResult;

@end
