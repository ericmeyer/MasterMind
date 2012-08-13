#import <SpecKit/SpecKit.h>
#import "MMGuessResultsViewControllerImplementation.h"
#import "MMGuessResultViewController.h"
#import "MMGuessResult.h"
#import "MockMMGuessResult.h"
#import "ConciseKit.h"

SpecKitContext(MMGuessResultsViewControllerSpec) {

    __block MMGuessResultsViewControllerImplementation* controller;

    Describe(@"controller", ^{
        
        It(@"starts with no guessResultViewControllers", ^{
            controller = [MMGuessResultsViewControllerImplementation new];
            
            [ExpectInt([controller.guessResultViewControllers count]) toBe: 0];
        });
        
        It(@"adds one guessResultViewController", ^{
            MMGuessResultImplementation* result = [MMGuessResultImplementation new];
            controller = [MMGuessResultsViewControllerImplementation new];
            
            [controller addGuessResult: result];
            
            [ExpectInt([controller.guessResultViewControllers count]) toBe: 1];
            NSObject<MMGuessResult>* actualGuessResult = [[controller.guessResultViewControllers objectAtIndex: 0] guessResult];
            [ExpectObj(actualGuessResult) toBeEqualTo: result];
        });
        
    });
    
    Describe(@"reset", ^{
        BeforeEach(^{
            controller = [MMGuessResultsViewControllerImplementation new];
        });
        
        It(@"removes the view from its parent", ^{
            UIViewController* parentController = [UIViewController new];
            MMGuessResultViewController* guessResultView = [MMGuessResultViewController new];
            [parentController.view addSubview: guessResultView.view];
            controller.guessResultViewControllers = $marr(guessResultView);

            [controller reset];
            
            [ExpectBool([parentController.view.subviews containsObject: guessResultView.view]) toBeFalse];
        });
        
        It(@"resets the array to empty", ^{
            MMGuessResultImplementation* result = [MMGuessResultImplementation new];
            [controller addGuessResult: result];

            [controller reset];
            
            [ExpectInt([controller.guessResultViewControllers count]) toBe: 0];
        });
        
    });

    
}
