#import <UIKit/UIKit.h>

@interface MMAvailablePegsViewController : UIViewController {
    NSString* activePegString;
    IBOutlet UILabel* activePegLabel;
    NSArray* availablePegs;
}
@property (nonatomic, retain) NSString* activePegString;
@property (nonatomic, retain) IBOutlet UILabel* activePegLabel;
@property (nonatomic, retain) NSArray* availablePegs;

-(IBAction) clickPeg:(id) sender;
-(IBAction) setPegActive:(id) sender;

@end
