#import <Foundation/Foundation.h>
#import "MMGame.h"

@interface GameRunner : NSObject {
    MMGame* game;
    NSArray* secretCode;
}
@property (nonatomic, retain) MMGame* game;
@property (nonatomic, retain) NSArray* secretCode;

@end
