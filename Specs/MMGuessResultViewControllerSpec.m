#import <SpecKit/SpecKit.h>
#import "MMGuessResultViewController.h"
#import "MMGuessResult.h"
#import "ConciseKit.h"

SpecKitContext(MMGuessResultViewControllerSpec) {
    
    __block MMGuessResultViewController* controller;
    
    Describe(@"controller", ^{
        
        It(@"exists", ^{
            controller = [MMGuessResultViewController new];

            [ExpectObj(controller) toExist];
        });
        
    });
 
    Describe(@"-updateView", ^{
        BeforeEach(^{
            controller = [MMGuessResultViewController new];
            controller.numberCorrectLabel = [UILabel new];
            controller.numberInWrongSpotLabel = [UILabel new];
            controller.remainingGuessesLabel = [UILabel new];
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
