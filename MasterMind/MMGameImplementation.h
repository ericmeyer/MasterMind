#import <Foundation/Foundation.h>
#import "MMGame.h"

@interface MMGameImplementation : NSObject<MMGame> {
    NSNumber* numberOfRemainingGuesses;
    NSArray* secretCode;
    NSMutableArray* guessResults;
}
@property (nonatomic, strong) NSNumber* numberOfRemainingGuesses;
@property (nonatomic, strong) NSMutableArray* guessResults;

-(BOOL) isOver;
-(BOOL) didWin;

@end
