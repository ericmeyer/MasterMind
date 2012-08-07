#import <Foundation/Foundation.h>
#import "MMGuessResult.h"

@protocol MMGame <NSObject>

// Get rid of this.  Replace with [MMGame gameWithCode: secretCode] on startNewGame;
@property (nonatomic, strong) NSArray* secretCode;

-(MMGuessResult*) lastGuessResult;
-(void) takeGuess: (NSArray*) guess;

@end
