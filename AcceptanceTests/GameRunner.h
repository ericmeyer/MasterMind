#import <Foundation/Foundation.h>
#import "MMGameImplementation.h"

@interface GameRunner : NSObject {
    MMGameImplementation* game;
}
@property (nonatomic, retain) MMGameImplementation* game;

@end
