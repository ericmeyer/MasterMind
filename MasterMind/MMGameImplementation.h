#import <Foundation/Foundation.h>
#import "MMGame.h"

@interface MMGameImplementation : NSObject<MMGame>

-(BOOL) isOver;
-(BOOL) didWin;

@end
