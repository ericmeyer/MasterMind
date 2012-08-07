#import <SpecKit/SpecKit.h>
#import "MMMainGameViewController.h"
#import "MockMMGame.h"
#import "MockMMPegListViewController.h"
#import "MockMMGuessResultsViewController.h"
#import "ConciseKit.h"

SpecKitContext(MMMainGameViewControllerSpec) {
    
    __block MMMainGameViewController* controller;
    
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
//            MockMMGuessResultsViewController* guessResultsController;
//            guessResultsController = [MockMMGuessResultsViewController new];
//            
//            controller.guessResultsViewController = guessResultsController;
//            Pending();
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
        
        It(@"calls takeGuess on the game with the given guess", ^{
            MockMMGame* mockGame = [MockMMGame new];
            controller.game = mockGame;
            MockMMPegListViewController* mockGuessViewController = [MockMMPegListViewController mockListWithPegs: @"1234"];
            controller.guessViewController = mockGuessViewController;
            [controller takeGuess];
            
            [ExpectObj([mockGame.lastGuess $join]) toBeEqualTo: @"1234"];
        });
        
        It(@"updates the guessResultsView", ^{
            MockMMGame* mockGame = [MockMMGame new];
            controller.game = mockGame;
            MockMMGuessResultsViewController* mockGuessResultsViewController = [MockMMGuessResultsViewController new];
            controller.guessResultsViewController = mockGuessResultsViewController;

            [controller takeGuess];

            [ExpectObj(mockGuessResultsViewController.updateViewCalledWith) toBeEqualTo: mockGame];
        });
                
    });
}