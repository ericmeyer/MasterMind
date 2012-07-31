#import <Foundation/Foundation.h>

@interface MMGame : NSObject {
    NSNumber* numberOfRemainingGuesses;
    NSString* secretCode;
}
@property (nonatomic, retain) NSNumber* numberOfRemainingGuesses;
@property (nonatomic, retain) NSString* secretCode;

-(BOOL) isOver;
-(BOOL) didWin;

-(void) takeGuess: (NSString*) guess;

@end
