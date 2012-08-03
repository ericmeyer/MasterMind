#import <UIKit/UIKit.h>
#import "MMCodePeg.h"

@interface MMAvailablePegsViewController : UIViewController {
    NSMutableArray* availablePegs;
    MMCodePeg* activePeg;
}
@property (nonatomic, retain) NSMutableArray* availablePegs;
@property (nonatomic, retain) MMCodePeg* activePeg;

-(IBAction) clickPeg:(id) sender;

@end
