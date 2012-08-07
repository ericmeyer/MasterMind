#import <Foundation/Foundation.h>
#import "MMGame.h"

@protocol MMViewWithGame <NSObject>

-(void) updateView:(NSObject<MMGame>*) game;

@end
