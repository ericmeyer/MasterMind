#import <UIKit/UIKit.h>
#import "MMPegListViewController.h"
#import "MMAvailablePegsViewController.h"

@interface ViewController : UIViewController {
    IBOutlet UILabel* numberCorrect;
    IBOutlet UILabel* numberInWrongSpot;
    IBOutlet UITextField* secretCode;
    IBOutlet UITextField* guess;
    IBOutlet MMPegListViewController* secretCodeViewController;
    IBOutlet MMPegListViewController* guessViewController;
    IBOutlet UIView* secretCodeView;
    MMAvailablePegsViewController* availablePegsViewController;
}
@property (nonatomic, retain) UILabel* numberCorrect;
@property (nonatomic, retain) UILabel* numberInWrongSpot;
@property (nonatomic, retain) UITextField* secretCode;
@property (nonatomic, retain) UITextField* guess;
@property (nonatomic, retain) MMPegListViewController* secretCodeViewController;
@property (nonatomic, retain) MMPegListViewController* guessViewController;
@property (nonatomic, retain) UIView* secretCodeView;
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsViewController;

-(IBAction) takeGuess;

@end
