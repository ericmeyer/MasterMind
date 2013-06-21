#import <OCDSpec2/OCDSpec2.h>
#import "MMAvailableColorsViewController.h"
#import "MMCodePeg.h"

OCDSpec2Context(MMAvailablePegsViewControllerSpec) {
    __block MMAvailableColorsViewController* controller;
    __block MMCodePeg* clickedPeg;
    
    Describe(@"on init", ^{
        
        It(@"has available pegs", ^{
            controller = [MMAvailableColorsViewController new];
            [controller viewDidLoad];
            
            [ExpectInt(controller.availableColors.count) toBe: 6];
        });
        
        It(@"has no activeColor", ^{
            controller = [MMAvailableColorsViewController new];
            
            [ExpectObj(controller.activeColor) toBeNil];
        });
        
    });
    
    Describe(@"clicking a peg", ^{
        
        BeforeEach(^{
            controller = [MMAvailableColorsViewController new];
            clickedPeg = [MMAvailableColor colorWithName: @"red"];
        });
        
        It(@"sets the activeColor to the clicked color", ^{
            [controller clickPeg: clickedPeg];
            
            [ExpectObj(controller.activeColor) toBeEqualTo: clickedPeg];
        });
        
        It(@"deactivates the previously clicked color", ^{
            MMCodePeg* secondPeg = [MMAvailableColor colorWithName: @"blue"];
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
        
        It(@"clicking the already active peg clears the activeColor", ^{
            [controller clickPeg: clickedPeg];
            [controller clickPeg: clickedPeg];
            
            [ExpectObj(controller.activeColor) toBeNil];
        });
        
    });
}