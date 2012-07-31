#import <UIKit/UIKit.h>

@interface MMAvailablePegsViewController : UIViewController {
    NSString* activePeg;
    IBOutlet UILabel* activePegLabel;
    NSArray* availablePegs;
}
@property (nonatomic, retain) NSString* activePeg;
@property (nonatomic, retain) IBOutlet UILabel* activePegLabel;
@property (nonatomic, retain) NSArray* availablePegs;

-(IBAction) clickPeg:(id) sender;
-(IBAction) setPegActive:(id) sender;

@end
