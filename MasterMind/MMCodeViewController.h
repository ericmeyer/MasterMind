#import <UIKit/UIKit.h>
#import "MMAvailablePegsViewController.h"

@interface MMCodeViewController : UIViewController {
    MMAvailablePegsViewController* availablePegsController;
    NSMutableArray* pegs;
}
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsController;
@property (nonatomic, retain) NSMutableArray* pegs;

-(IBAction) touchPeg:(id) sender;

-(NSArray*) code;

@end
