#import <Foundation/Foundation.h>
#import "MMGameImplementation.h"

@interface GameRunner : NSObject {
    MMGameImplementation* game;
    NSArray* secretCode;
}
@property (nonatomic, retain) MMGameImplementation* game;
@property (nonatomic, retain) NSArray* secretCode;

@end
