#import <UIKit/UIKit.h>
#import "MMAvailablePegsViewController.h"
#import "MMGame.h"
#import "MMPegList.h"
#import "MMViewWithGame.h"

@interface MMMainGameViewController : UIViewController {
    MMAvailablePegsViewController* availablePegsViewController;
    UIViewController<MMPegList>* secretCodeViewController;
    UIViewController<MMPegList>* guessViewController;
    UIViewController<MMViewWithGame>* guessResultsViewController;
    
    NSObject<MMGame>* game;
}
@property (nonatomic, retain) MMAvailablePegsViewController* availablePegsViewController;
@property (nonatomic, retain) UIViewController<MMPegList>* secretCodeViewController;
@property (nonatomic, retain) UIViewController<MMPegList>* guessViewController;
@property (nonatomic, retain) UIViewController<MMViewWithGame>* guessResultsViewController;

@property (nonatomic, retain) NSObject<MMGame>* game;

-(IBAction) startNewGame;
-(IBAction) takeGuess;

@end
