#import <SpecKit/SpecKit.h>
#import "MMMainGameViewController.h"
#import "MockMMGame.h"
#import "MockMMPegListViewController.h"
#import "MockMMGuessHistoryViewController.h"
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

        It(@"has a guess history view controller", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.guessHistoryViewController) toExist];
        });

    });

    Describe(@"taking a guess", ^{

        BeforeEach(^{
            mockGame = [MockMMGame new];
//            mockGame.lastGuessResult = [MMGuessResult new];
            [mockGame.guessResults addObject: [MMGuessResult new]];
            controller.game = mockGame;
        });

        It(@"calls takeGuess on the game with the given guess", ^{
            controller.guessViewController = [MockMMPegListViewController mockListWithPegs: @"1234"];;
            [controller takeGuess];

            [ExpectObj([mockGame.lastGuess $join]) toBeEqualTo: @"1234"];
        });

        It(@"updates the guess history controller", ^{
            MockMMGuessHistoryViewController* mockGuessHistoryViewController = [MockMMGuessHistoryViewController new];
            controller.guessHistoryViewController = mockGuessHistoryViewController;
            
            [controller takeGuess];
            
            [ExpectObj(mockGuessHistoryViewController.addGuessResultCalldWith) toBeEqualTo: [mockGame.guessResults lastObject]];
        });

    });

    Describe(@"start new game", ^{

        It(@"creates a new game with the secret code", ^{
            controller.secretCodeViewController = [MockMMPegListViewController mockListWithPegs: @"5678"];;
            [controller startNewGame];

            [ExpectObj([controller.game.secretCode $join]) toBeEqualTo: @"5678"];
        });

    });
}