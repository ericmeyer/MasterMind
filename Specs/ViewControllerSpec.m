#import <SpecKit/SpecKit.h>
#import "ViewController.h"
#import "MockMMGame.h"
#import "MockMMPegListViewController.h"
#import "MockMMGuessResultsViewController.h"
#import "ConciseKit.h"

SpecKitContext(ViewControllerSpec) {
    
    __block ViewController* controller;
    
    BeforeEach(^{
        controller = [[ViewController alloc] init];
        controller.numberCorrect = [[UILabel alloc] init];
        controller.numberInWrongSpot = [[UILabel alloc] init];
        controller.secretCode = [[UITextField alloc] init];
        controller.guess = [[UITextField alloc] init];
    });
    
    Describe(@"ViewController", ^{
        
        It(@"sets the number correct to empty on viewDidLoad", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberCorrect.text) toBeEqualTo: @""];
        });
        
        It(@"sets the number in wrong spot on viewDidLoad", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberInWrongSpot.text) toBeEqualTo: @""];
        });
        
        It(@"has a secret code", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.secretCode.text) toBeEqualTo: @"YGRB"];
        });
        
        It(@"has a guess", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.guess.text) toBeEqualTo: @"GGGG"];
        });
        
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