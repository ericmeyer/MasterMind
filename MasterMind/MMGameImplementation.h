#import <Foundation/Foundation.h>

@interface MMGameImplementation : NSObject {
    NSNumber* numberOfRemainingGuesses;
    NSArray* secretCode;
}
@property (nonatomic, retain) NSNumber* numberOfRemainingGuesses;
@property (nonatomic, retain) NSArray* secretCode;

-(BOOL) isOver;
-(BOOL) didWin;

-(void) takeGuess: (NSArray*) guess;

@end
