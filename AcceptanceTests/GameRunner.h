#import <Foundation/Foundation.h>
#import "MMGame.h"

@interface GameRunner : NSObject {
    MMGame* game;
}
@property (nonatomic, retain) MMGame* game;

@end
