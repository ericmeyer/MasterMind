#import <SpecKit/SpecKit.h>
#import "MMGuessResultsViewController.h"
#import "MockMMGame.h"

SpecKitContext(MMGuessResultsViewControllerSpec) {
    
    __block MMGuessResultsViewController* controller;
    __block MockMMGame* game;
    
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
            game = [MockMMGame gameWithLastCorrect: 123 andInWrongSpot: 456];
        });
        
        It(@"updates the number correct label", ^{
            [controller updateView: game];
            
            [ExpectObj(controller.numberCorrectLabel.text) toBeEqualTo: @"123"];
        });

        It(@"updates the number in wrong spot label", ^{
            [controller updateView: game];
            
            [ExpectObj(controller.numberInWrongSpotLabel.text) toBeEqualTo: @"456"];
        });
        
        It(@"updates the remaining guesses", ^{
            game.numberOfRemainingGuesses = [NSNumber numberWithInt: 314];
            [controller updateView: game];
            
            [ExpectObj(controller.remainingGuessesLabel.text) toBeEqualTo: @"314"];
        });

    });
}
