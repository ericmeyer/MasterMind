#import <UIKit/UIKit.h>
#import "MMViewWithGame.h"
#import "MMGame.h"

@interface MockMMViewWithGame : UIViewController<MMViewWithGame> {
    NSObject<MMGame>* updateViewCalledWith;
}
@property (nonatomic, strong) NSObject<MMGame>* updateViewCalledWith;

@end
