#import <Foundation/Foundation.h>
#import "MMGame.h"

@interface MMGameImplementation : NSObject<MMGame> {
    NSNumber* numberOfRemainingGuesses;
    NSArray* secretCode;
    NSMutableArray* guessResults;
}
@property (nonatomic, strong) NSMutableArray* guessResults;

+(id) gameWithCode:(NSArray*) givenSecretCode;

-(BOOL) isOver;
-(BOOL) didWin;

@end
