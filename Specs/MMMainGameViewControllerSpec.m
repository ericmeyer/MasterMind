#import <SpecKit/SpecKit.h>
#import "MMMainGameViewController.h"
#import "MockMMGame.h"
#import "MockMMPegListViewController.h"
#import "MockMMGuessResultsViewController.h"
#import "MockMMGuessResult.h"
#import "ConciseKit.h"

SpecKitContext(MMMainGameViewControllerSpec) {

    __block MMMainGameViewController* controller;
    __block MockMMGame* mockGame;

    BeforeEach(^{
        controller = [[MMMainGameViewController alloc] init];
    });

    Describe(@"MMMainGameViewController", ^{

        It(@"has a secrect code view controller", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.secretCodeViewController) toExist];
        });

        It(@"has a guess view controller", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.guessViewController) toExist];
        });

        It(@"has an available pegs view controller", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.availableColorsViewController) toExist];
        });

        It(@"sets the secret code's availableColors", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.secretCodeViewController.availableColorsController)
             toBeEqualTo: controller.availableColorsViewController];
        });

        It(@"sets the guess' availableColors", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.guessViewController.availableColorsController)
             toBeEqualTo: controller.availableColorsViewController];
        });

        It(@"has a guess results view controller", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.guessResultsViewController) toExist];
        });

    });

    Describe(@"taking a guess", ^{

        BeforeEach(^{
            mockGame = [MockMMGame new];
            [mockGame.guessResults addObject: [MockMMGuessResult new]];
            controller.game = mockGame;
            controller.guessButton = [UIButton new];
        });

        It(@"calls takeGuess on the game with the given guess", ^{
            controller.guessViewController = [MockMMPegListViewController mockListWithPegs: @"1234"];;
            [controller takeGuess];

            [ExpectObj([mockGame.lastGuess $join]) toBeEqualTo: @"1234"];
        });

        It(@"updates the guess results controller", ^{
            MockMMGuessResultsViewController* mockGuessResultsViewController = [MockMMGuessResultsViewController new];
            controller.guessResultsViewController = mockGuessResultsViewController;
            
            [controller takeGuess];
            
            [ExpectObj(mockGuessResultsViewController.addGuessResultCalldWith) toBeEqualTo: [mockGame.guessResults lastObject]];
        });
        
        It(@"disables the guess button if the game is over", ^{
            mockGame.isOver = YES;
            [controller takeGuess];
            
            [ExpectBool(controller.guessButton.enabled) toBeFalse];
        });

        It(@"does not disable the guess button if the game is not over", ^{
            mockGame.isOver = NO;
            [controller takeGuess];
            
            [ExpectBool(controller.guessButton.enabled) toBeTrue];
        });

    });

    Describe(@"start new game", ^{

        BeforeEach(^{
            controller.guessButton = [UIButton new];
        });
        
        It(@"creates a new game with the secret code", ^{
            PendingStr(@"Un-pend this test once your game exists");
//            controller.secretCodeViewController = [MockMMPegListViewController mockListWithPegs: @"5678"];;
//            [controller startNewGame];
//
//            [ExpectObj([controller.game.secretCode $join]) toBeEqualTo: @"5678"];
        });

        It(@"resets the guess results view", ^{
            MockMMGuessResultsViewController* guessResultsView = [MockMMGuessResultsViewController new];
            controller.guessResultsViewController = guessResultsView;
            [controller startNewGame];
            
            [ExpectBool(guessResultsView.wasResetCalled) toBeTrue];
        });
        
        It(@"reenables the guess button if it is disabled", ^{
            [controller.guessButton setEnabled: NO];

            [controller startNewGame];
            
            [ExpectBool(controller.guessButton.enabled) toBeTrue];
        });

    });
}