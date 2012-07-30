#import <Foundation/Foundation.h>
#import "MMAvailablePegsController.h"

@interface SecretCodeViewController : NSObject {
    NSString* pegOne;
    NSString* pegTwo;
    MMAvailablePegsController* availablePegsController;
}
@property (nonatomic, retain) NSString* pegOne;
@property (nonatomic, retain) NSString* pegTwo;
@property (nonatomic, retain) MMAvailablePegsController* availablePegsController;

-(void) touchPegOne;
-(void) touchPegTwo;

@end
