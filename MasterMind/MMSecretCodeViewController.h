#import <UIKit/UIKit.h>
#import "MMAvailablePegsViewController.h"

@interface MMSecretCodeViewController : UIViewController {
    IBOutlet UIButton* pegOne;
    IBOutlet UIButton* pegTwo;
    MMAvailablePegsViewController* availablePegsController;
}
@property (nonatomic, retain) UIButton* pegOne;
@property (nonatomic, retain) UIButton* pegTwo;
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsController;

-(IBAction) touchPegOne;
-(IBAction) touchPegTwo;


@end
