#import <UIKit/UIKit.h>
#import "MMCodeViewController.h"
#import "MMAvailablePegsViewController.h"

@interface ViewController : UIViewController {
    IBOutlet UILabel* numberCorrect;
    IBOutlet UILabel* numberInWrongSpot;
    IBOutlet UITextField* secretCode;
    IBOutlet UITextField* guess;
    IBOutlet MMCodeViewController* secretCodeViewController;
    IBOutlet UIView* secretCodeView;
    MMAvailablePegsViewController* availablePegsViewController;
}
@property (nonatomic, retain) UILabel* numberCorrect;
@property (nonatomic, retain) UILabel* numberInWrongSpot;
@property (nonatomic, retain) UITextField* secretCode;
@property (nonatomic, retain) UITextField* guess;
@property (nonatomic, retain) MMCodeViewController* secretCodeViewController;
@property (nonatomic, retain) UIView* secretCodeView;
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsViewController;

-(IBAction) takeGuess;

@end
