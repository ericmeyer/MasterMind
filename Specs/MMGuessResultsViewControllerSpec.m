#import <SpecKit/SpecKit.h>
#import "MMGuessResultsViewController.h"
//#import "MockMMGame.h"
#import "MMGuessResult.h"
#import "ConciseKit.h"

SpecKitContext(MMGuessResultsViewControllerSpec) {
    
    __block MMGuessResultsViewController* controller;
//    __block MockMMGame* game;
    
    Describe(@"controller", ^{
        
        It(@"exists", ^{
            controller = [MMGuessResultsViewController new];

            [ExpectObj(controller) toExist];
        });
        
    });
 
    Describe(@"-updateView", ^{
        BeforeEach(^{
            controller = [MMGuessResultsViewController new];
            controller.numberCorrectLabel = [UILabel new];
            controller.numberInWrongSpotLabel = [UILabel new];
            controller.remainingGuessesLabel = [UILabel new];
//            game = [MockMMGame gameWithLastCorrect: 123 andInWrongSpot: 456];
            controller.guessResult = [MMGuessResult resultFromCode: [@"1234" $chars] andGuess: [@"1423" $chars]];
        });
        
        It(@"updates the number correct label", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberCorrectLabel.text) toBeEqualTo: @"1"];
        });

        It(@"updates the number in wrong spot label", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberInWrongSpotLabel.text) toBeEqualTo: @"3"];
        });
        
    });
}
