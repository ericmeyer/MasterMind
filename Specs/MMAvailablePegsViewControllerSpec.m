#import <SpecKit/SpecKit.h>
#import "MMAvailablePegsViewController.h"
#import "MMCodePeg.h"

SpecKitContext(MMAvailablePegsViewControllerSpec) {
    __block MMAvailablePegsViewController* controller;
    __block MMCodePeg* clickedPeg;
    
    Describe(@"on init", ^{
        
        It(@"has 4 pegs", ^{
            controller = [MMAvailablePegsViewController new];
            
            [ExpectInt(controller.availablePegs.count) toBe: 4];            
        });
        
        It(@"has no activePeg", ^{
            controller = [MMAvailablePegsViewController new];
            
            [ExpectObj(controller.activePeg) toBeNil];
        });
        
    });
    
    Describe(@"clicking a peg", ^{
        
        BeforeEach(^{
            controller = [MMAvailablePegsViewController new];
            clickedPeg = [MMCodePeg pegWithColor: @"red"];
        });
        
        It(@"sets the activePeg to the clicked peg", ^{
            [controller clickPeg: clickedPeg];
            
            [ExpectObj(controller.activePeg) toBeEqualTo: clickedPeg];
        });
        
        It(@"deactivates the previously clicked peg", ^{
            MMCodePeg* secondPeg = [MMCodePeg pegWithColor: @"blue"];
            [controller clickPeg: clickedPeg];
            [controller clickPeg: secondPeg];
            
            [ExpectBool(clickedPeg.isActive) toBeFalse];
        });
        
        It(@"activates the peg", ^{
            [controller clickPeg: clickedPeg];
            
            [ExpectBool(clickedPeg.isActive) toBeTrue];
        });
        
        It(@"clicking the already active peg deactivates the peg", ^{
            [controller clickPeg: clickedPeg];
            [controller clickPeg: clickedPeg];
            
            [ExpectBool(clickedPeg.isActive) toBeFalse];
        });
        
        It(@"clicking the already active peg clears the activePeg", ^{
            [controller clickPeg: clickedPeg];
            [controller clickPeg: clickedPeg];
            
            [ExpectObj(controller.activePeg) toBeNil];
        });
        
    });
}