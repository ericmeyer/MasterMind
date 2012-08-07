#import <SpecKit/SpecKit.h>
#import "MMMainGameViewController.h"
#import "MockMMGame.h"
#import "MockMMPegListViewController.h"
#import "MockMMGuessResultsViewController.h"
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

            [ExpectObj(controller.availablePegsViewController) toExist];
        });

        It(@"sets the secret code's availablePegs", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.secretCodeViewController.availablePegsController)
             toBeEqualTo: controller.availablePegsViewController];
        });

        It(@"has a guess results view controller", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.guessResultsViewController) toExist];
        });

        It(@"has a game", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.game) toExist];
        });

        It(@"sets the guess' availablePegs", ^{
            [controller viewDidLoad];

            [ExpectObj(controller.guessViewController.availablePegsController)
             toBeEqualTo: controller.availablePegsViewController];
        });

    });

    Describe(@"taking a guess", ^{

        BeforeEach(^{
            mockGame = [MockMMGame new];
            controller.game = mockGame;
        });

        It(@"calls takeGuess on the game with the given guess", ^{
            controller.guessViewController = [MockMMPegListViewController mockListWithPegs: @"1234"];;
            [controller takeGuess];

            [ExpectObj([mockGame.lastGuess $join]) toBeEqualTo: @"1234"];
        });

        It(@"updates the guessResultsView", ^{
            MockMMGuessResultsViewController* mockGuessResultsViewController = [MockMMGuessResultsViewController new];
            controller.guessResultsViewController = mockGuessResultsViewController;

            [controller takeGuess];

            [ExpectObj(mockGuessResultsViewController.updateViewCalledWith) toBeEqualTo: mockGame];
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