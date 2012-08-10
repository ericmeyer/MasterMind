#import <Foundation/Foundation.h>
#import "MMGame.h"

@interface MMGameImplementation : NSObject<MMGame> {
    NSNumber* numberOfRemainingGuesses;
    NSArray* secretCode;
    NSMutableArray* guessResults;
}
-(BOOL) isOver;
-(BOOL) didWin;

@end
