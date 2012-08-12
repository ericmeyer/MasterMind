#import <UIKit/UIKit.h>
#import "MMAvailableColorsViewController.h"
#import "MMGame.h"
#import "MMPegList.h"
#import "MMViewWithGame.h"
#import "MMGuessResultsViewControllerImplementation.h"
#import "MMGuessResultsView.h"

@interface MMMainGameViewController : UIViewController {
    MMAvailableColorsViewController* availableColorsViewController;
    UIViewController<MMPegList>* secretCodeViewController;
    UIViewController<MMPegList>* guessViewController;
    UIViewController<MMGuessResultsView>* guessResultsViewController;
    
    NSObject<MMGame>* game;
}
@property (nonatomic, strong) MMAvailableColorsViewController* availableColorsViewController;
@property (nonatomic, strong) UIViewController<MMPegList>* secretCodeViewController;
@property (nonatomic, strong) UIViewController<MMPegList>* guessViewController;
@property (nonatomic, strong) UIViewController<MMGuessResultsView>* guessResultsViewController;

@property (nonatomic, strong) NSObject<MMGame>* game;

@property (nonatomic, strong) IBOutlet UILabel* bankLabel;

-(IBAction) startNewGame;
-(IBAction) takeGuess;

@end
