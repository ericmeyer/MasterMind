#import <Foundation/Foundation.h>
#import "MMGuessResult.h"

@protocol MMGuessResultsView <NSObject>

-(void) reset;
-(void) addGuessResult:(NSObject<MMGuessResult>*) guessResult;

@end
