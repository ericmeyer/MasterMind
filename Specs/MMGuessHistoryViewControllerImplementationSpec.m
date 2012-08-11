#import <SpecKit/SpecKit.h>
#import "MMGuessHistoryViewControllerImplementation.h"
#import "MMGuessResultsViewController.h"
#import "MMGuessResult.h"
#import "ConciseKit.h"

SpecKitContext(MMGuessHistoryViewControllerSpec) {
    
    Describe(@"controller", ^{
        
        It(@"starts with no guessResultViewControllers", ^{
            MMGuessHistoryViewControllerImplementation* controller;
            controller = [MMGuessHistoryViewControllerImplementation new];
            
            [ExpectInt([controller.guessResultViewControllers count]) toBe: 0];
        });
        
        It(@"adds one guessResultViewController", ^{
            MMGuessHistoryViewControllerImplementation* controller;
            MMGuessResult* result = [MMGuessResult resultFromCode: [@"1234" $chars]
                                                         andGuess: [@"1234" $chars]];
            controller = [MMGuessHistoryViewControllerImplementation new];
            
            [controller addGuessResult: result];
            
            [ExpectInt([controller.guessResultViewControllers count]) toBe: 1];
            MMGuessResult* actualGuessResult = [[controller.guessResultViewControllers objectAtIndex: 0] guessResult];
            [ExpectObj(actualGuessResult) toBeEqualTo: result];
        });
        
    });
    
}
