#import <UIKit/UIKit.h>
#import "MMAvailableColorsViewController.h"
#import "MMGame.h"
#import "MMPegList.h"
#import "MMViewWithGame.h"
#import "MMGuessHistoryViewControllerImplementation.h"
#import "MMGuessHistoryViewController.h"

@interface MMMainGameViewController : UIViewController {
    MMAvailableColorsViewController* availableColorsViewController;
    UIViewController<MMPegList>* secretCodeViewController;
    UIViewController<MMPegList>* guessViewController;
    UIViewController<MMGuessHistoryViewController>* guessHistoryViewController;
    
    NSObject<MMGame>* game;
}
@property (nonatomic, strong) MMAvailableColorsViewController* availableColorsViewController;
@property (nonatomic, strong) UIViewController<MMPegList>* secretCodeViewController;
@property (nonatomic, strong) UIViewController<MMPegList>* guessViewController;
@property (nonatomic, strong) UIViewController<MMGuessHistoryViewController>* guessHistoryViewController;

@property (nonatomic, strong) NSObject<MMGame>* game;

@property (nonatomic, strong) IBOutlet UILabel* bankLabel;

-(IBAction) startNewGame;
-(IBAction) takeGuess;

@end
