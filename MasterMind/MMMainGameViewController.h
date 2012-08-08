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
@property (nonatomic, strong) MMAvailablePegsViewController* availablePegsViewController;
@property (nonatomic, strong) UIViewController<MMPegList>* secretCodeViewController;
@property (nonatomic, strong) UIViewController<MMPegList>* guessViewController;
@property (nonatomic, strong) UIViewController<MMViewWithGame>* guessResultsViewController;

@property (nonatomic, strong) NSObject<MMGame>* game;

-(IBAction) startNewGame;
-(IBAction) takeGuess;

@end
