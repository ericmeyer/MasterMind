#import <SpecKit/SpecKit.h>
#import "MMGuessResultViewController.h"
#import "MockMMGuessResult.h"
#import "ConciseKit.h"
#import "MMCodePeg.h"

SpecKitContext(MMGuessResultViewControllerSpec) {
    
    __block MMGuessResultViewController* controller;

    Describe(@"-viewDidLoad", ^{
        
        BeforeEach(^{
            NSArray* guess = $arr(@"red", @"blue", @"orange", @"purple");
            MockMMGuessResult* guessResult = [MockMMGuessResult withNumberCorrect: 123
                                                                numberInWrongSpot: 456
                                                                         andGuess: guess];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
            controller.numberCorrectLabel = [UILabel new];
            controller.numberInWrongSpotLabel = [UILabel new];
        });
        
        It(@"updates the number correct label", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberCorrectLabel.text) toBeEqualTo: @"123"];
        });

        It(@"updates the number in wrong spot label", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberInWrongSpotLabel.text) toBeEqualTo: @"456"];
        });
        
        It(@"builds the pegs", ^{
            [controller viewDidLoad];

            [ExpectInt([controller.pegs count]) toBe: 4];
        });
        
        It(@"disables each peg", ^{
            [controller viewDidLoad];
            
            [controller.pegs $each:^(id obj) {
                MMCodePeg* peg = (MMCodePeg*)obj;
                [ExpectBool(peg.enabled) toBeFalse];
            }];
        });

    });
}
