#import <UIKit/UIKit.h>
#import "MMPegListViewController.h"
#import "MMAvailablePegsViewController.h"
#import "MMGame.h"
#import "MMPegList.h"
#import "MMViewWithGame.h"

@interface ViewController : UIViewController {
    IBOutlet UILabel* numberCorrect;
    IBOutlet UILabel* numberInWrongSpot;
    IBOutlet UITextField* secretCode;
    IBOutlet UITextField* guess;
    IBOutlet MMPegListViewController* secretCodeViewController;
    UIViewController<MMPegList>* guessViewController;
    IBOutlet UIView* secretCodeView;
    MMAvailablePegsViewController* availablePegsViewController;
    
    NSObject<MMGame>* game;
    UIViewController<MMViewWithGame>* guessResultsViewController;
}
@property (nonatomic, retain) UILabel* numberCorrect;
@property (nonatomic, retain) UILabel* numberInWrongSpot;
@property (nonatomic, retain) UITextField* secretCode;
@property (nonatomic, retain) UITextField* guess;
@property (nonatomic, retain) MMPegListViewController* secretCodeViewController;
@property (nonatomic, retain) UIViewController<MMPegList>* guessViewController;
@property (nonatomic, retain) UIView* secretCodeView;
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsViewController;

@property (nonatomic, retain) NSObject<MMGame>* game;
@property (nonatomic, retain) UIViewController<MMViewWithGame>* guessResultsViewController;

-(IBAction) takeGuess;
-(IBAction) setCode;

@end
