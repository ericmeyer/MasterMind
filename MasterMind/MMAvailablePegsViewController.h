#import <UIKit/UIKit.h>
#import "MMAvailablePeg.h"

@interface MMAvailablePegsViewController : UIViewController {
    NSString* activePegString;
    IBOutlet UILabel* activePegLabel;
    NSMutableArray* availablePegs;
    MMAvailablePeg* activePeg;
}
@property (nonatomic, retain) NSString* activePegString;
@property (nonatomic, retain) IBOutlet UILabel* activePegLabel;
@property (nonatomic, retain) NSMutableArray* availablePegs;
@property (nonatomic, retain) MMAvailablePeg* activePeg;

-(IBAction) clickPeg:(id) sender;

@end
