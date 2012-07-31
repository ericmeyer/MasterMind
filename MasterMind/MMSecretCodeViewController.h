#import <UIKit/UIKit.h>
#import "MMAvailablePegsViewController.h"

@interface MMSecretCodeViewController : UIViewController {
    NSString* pegOne;
    NSString* pegTwo;
    MMAvailablePegsViewController* availablePegsController;
}
@property (nonatomic, retain) NSString* pegOne;
@property (nonatomic, retain) NSString* pegTwo;
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsController;

-(IBAction) touchPegOne;
-(IBAction) touchPegTwo;


@end
