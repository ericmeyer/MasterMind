#import <UIKit/UIKit.h>
#import "MMSecretCodeViewController.h"
#import "MMAvailablePegsViewController.h"

@interface ViewController : UIViewController {
    IBOutlet UILabel* numberCorrect;
    IBOutlet UILabel* numberInWrongSpot;
    IBOutlet UITextField* secretCode;
    IBOutlet UITextField* guess;
    IBOutlet MMSecretCodeViewController* secretCodeViewController;
    IBOutlet UIView* secretCodeView;
    MMAvailablePegsViewController* availablePegsViewController;
}
@property (nonatomic, retain) UILabel* numberCorrect;
@property (nonatomic, retain) UILabel* numberInWrongSpot;
@property (nonatomic, retain) UITextField* secretCode;
@property (nonatomic, retain) UITextField* guess;
@property (nonatomic, retain) MMSecretCodeViewController* secretCodeViewController;
@property (nonatomic, retain) UIView* secretCodeView;
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsViewController;

-(IBAction) takeGuess;

@end
