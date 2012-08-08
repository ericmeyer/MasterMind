#import <UIKit/UIKit.h>
#import "MMCodePeg.h"

@interface MMAvailablePegsViewController : UIViewController {
    NSMutableArray* availablePegs;
    MMCodePeg* activePeg;
}
@property (nonatomic, strong) NSMutableArray* availablePegs;
@property (nonatomic, strong) MMCodePeg* activePeg;

-(IBAction) clickPeg:(id) sender;

@end
