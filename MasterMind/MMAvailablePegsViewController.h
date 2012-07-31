#import <UIKit/UIKit.h>

@interface MMAvailablePegsViewController : UIViewController {
    NSString* activePeg;
    IBOutlet UILabel* activePegLabel;
}
@property (nonatomic, retain) NSString* activePeg;
@property (nonatomic, retain) IBOutlet UILabel* activePegLabel;

-(IBAction) clickPeg:(id) sender;

@end
