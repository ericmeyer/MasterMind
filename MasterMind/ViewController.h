#import <UIKit/UIKit.h>
#import "MMPegListViewController.h"
#import "MMAvailablePegsViewController.h"
#import "MMGame.h"
#import "MMPegList.h"
#import "MMViewWithGame.h"

@interface ViewController : UIViewController {
    IBOutlet MMPegListViewController* secretCodeViewController;
    UIViewController<MMPegList>* guessViewController;
    MMAvailablePegsViewController* availablePegsViewController;
    
    NSObject<MMGame>* game;
    UIViewController<MMViewWithGame>* guessResultsViewController;
}
@property (nonatomic, retain) MMPegListViewController* secretCodeViewController;
@property (nonatomic, retain) UIViewController<MMPegList>* guessViewController;
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsViewController;

@property (nonatomic, retain) NSObject<MMGame>* game;
@property (nonatomic, retain) UIViewController<MMViewWithGame>* guessResultsViewController;

-(IBAction) takeGuess;
-(IBAction) setCode;

@end
