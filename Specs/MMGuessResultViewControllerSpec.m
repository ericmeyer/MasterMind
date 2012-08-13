#import <SpecKit/SpecKit.h>
#import "MMGuessResultViewController.h"
#import "MockMMGuessResult.h"
#import "ConciseKit.h"

SpecKitContext(MMGuessResultViewControllerSpec) {
    
    __block MMGuessResultViewController* controller;

    Describe(@"-viewDidLoad", ^{
        
        BeforeEach(^{
            controller = [MMGuessResultViewController new];
            controller.numberCorrectLabel = [UILabel new];
            controller.numberInWrongSpotLabel = [UILabel new];
            NSArray* guess = $arr(@"red", @"blue", @"orange", @"purple");
            controller.guessResult = [MockMMGuessResult withNumberCorrect: 123
                                                        numberInWrongSpot: 456
                                                                 andGuess: guess];
        });
        
        It(@"updates the number correct label", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberCorrectLabel.text) toBeEqualTo: @"123"];
        });

        It(@"updates the number in wrong spot label", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberInWrongSpotLabel.text) toBeEqualTo: @"456"];
        });

    });
}
