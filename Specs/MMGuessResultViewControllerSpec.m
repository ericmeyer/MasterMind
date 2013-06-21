#import <OCDSpec2/OCDSpec2.h>
#import "MMGuessResultViewController.h"
#import "MockMMGuessResult.h"
#import "ConciseKit.h"
#import "MMCodePeg.h"

OCDSpec2Context(MMGuessResultViewControllerSpec) {
    
    __block MMGuessResultViewController* controller;
    __block MockMMGuessResult* guessResult;
    
    Describe(@"showing the guess", ^{
        
        BeforeEach(^{
            NSArray* guess = $arr(@"red", @"blue", @"orange", @"purple");
            guessResult = [MockMMGuessResult withNumberCorrect: 1
                                             numberInWrongSpot: 2
                                                      andGuess: guess];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
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
    
    Describe(@"showing results of the guess", ^{
        
        It(@"has no pegs when nothing is right", ^{
            guessResult = [MockMMGuessResult withNumberCorrect: 0
                                             numberInWrongSpot: 0];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
            [controller viewDidLoad];
            
            [ExpectInt([controller.resultPegs count]) toBe: 0];
        });

        It(@"has 1 peg when one is in the right spot", ^{
            guessResult = [MockMMGuessResult withNumberCorrect: 1
                                             numberInWrongSpot: 0];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
            [controller viewDidLoad];

            [ExpectInt([controller.resultPegs count]) toBe: 1];
        });

        It(@"has 2 pegs when two are in the right spot", ^{
            guessResult = [MockMMGuessResult withNumberCorrect: 2
                                             numberInWrongSpot: 0];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
            [controller viewDidLoad];
            
            [ExpectInt([controller.resultPegs count]) toBe: 2];
        });

        It(@"has 2 pegs when two are in the wrong spot", ^{
            guessResult = [MockMMGuessResult withNumberCorrect: 0
                                             numberInWrongSpot: 2];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
            [controller viewDidLoad];
            
            [ExpectInt([controller.resultPegs count]) toBe: 2];
        });

        It(@"has 2 pegs when there are both result", ^{
            guessResult = [MockMMGuessResult withNumberCorrect: 1
                                             numberInWrongSpot: 2];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
            [controller viewDidLoad];
            
            [ExpectInt([controller.resultPegs count]) toBe: 3];
        });

        It(@"adds the result pegs to the view", ^{
            guessResult = [MockMMGuessResult withNumberCorrect: 1
                                             numberInWrongSpot: 2];
            controller = [[MMGuessResultViewController alloc] initWithGuessResult: guessResult];
            [controller viewDidLoad];

            [controller.resultPegs $each:^(id peg) {
                [ExpectBool([controller.view.subviews containsObject: peg]) toBeTrue];
            }];
        });
        
    });
    
}
