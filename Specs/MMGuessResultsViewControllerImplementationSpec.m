#import <SpecKit/SpecKit.h>
#import "MMGuessResultsViewControllerImplementation.h"
#import "MMGuessResultViewController.h"
#import "MMGuessResult.h"
#import "ConciseKit.h"

SpecKitContext(MMGuessResultsViewControllerSpec) {
    
    Describe(@"controller", ^{
        
        It(@"starts with no guessResultViewControllers", ^{
            MMGuessResultsViewControllerImplementation* controller;
            controller = [MMGuessResultsViewControllerImplementation new];
            
            [ExpectInt([controller.guessResultViewControllers count]) toBe: 0];
        });
        
        It(@"adds one guessResultViewController", ^{
            MMGuessResultsViewControllerImplementation* controller;
            MMGuessResultImplementation* result = [MMGuessResultImplementation resultFromCode: [@"1234" $chars]
                                                         andGuess: [@"1234" $chars]];
            controller = [MMGuessResultsViewControllerImplementation new];
            
            [controller addGuessResult: result];
            
            [ExpectInt([controller.guessResultViewControllers count]) toBe: 1];
            NSObject<MMGuessResult>* actualGuessResult = [[controller.guessResultViewControllers objectAtIndex: 0] guessResult];
            [ExpectObj(actualGuessResult) toBeEqualTo: result];
        });
        
    });
    
}
