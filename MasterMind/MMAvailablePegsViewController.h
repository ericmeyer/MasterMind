#import <UIKit/UIKit.h>
#import "MMCodePeg.h"

@interface MMAvailablePegsViewController : UIViewController {
    NSString* activePegString;
    IBOutlet UILabel* activePegLabel;
    NSMutableArray* availablePegs;
    MMCodePeg* activePeg;
}
@property (nonatomic, retain) NSString* activePegString;
@property (nonatomic, retain) IBOutlet UILabel* activePegLabel;
@property (nonatomic, retain) NSMutableArray* availablePegs;
@property (nonatomic, retain) MMCodePeg* activePeg;

-(IBAction) clickPeg:(id) sender;

@end
