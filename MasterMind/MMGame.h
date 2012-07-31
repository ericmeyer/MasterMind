#import <Foundation/Foundation.h>

@interface MMGame : NSObject {
    NSNumber* numberOfRemainingGuesses;
}
@property (nonatomic, retain) NSNumber* numberOfRemainingGuesses;

-(BOOL) isOver;
-(BOOL) didWin;

@end
