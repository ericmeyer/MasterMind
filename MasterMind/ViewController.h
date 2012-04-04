#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UILabel* numberCorrect;
    IBOutlet UILabel* numberInWrongSpot;
    IBOutlet UITextField* secretCode;
    IBOutlet UITextField* guess;
}
@property (nonatomic, retain) UILabel* numberCorrect;
@property (nonatomic, retain) UILabel* numberInWrongSpot;
@property (nonatomic, retain) UITextField* secretCode;
@property (nonatomic, retain) UITextField* guess;

-(IBAction) takeGuess;

@end
