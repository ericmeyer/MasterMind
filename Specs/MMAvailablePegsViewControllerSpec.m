#import "OCDSpec/OCDSpec.h"
#import "MMAvailablePegsViewController.h"
#import "MMCodePeg.h"

CONTEXT(MMAvailablePegsViewControllerSpec)
{
    __block MMAvailablePegsViewController* controller;
    __block MMCodePeg* clickedPeg;
    
    describe(@"on init",
             it(@"has 4 pegs",
                ^{
                    controller = [MMAvailablePegsViewController new];

                    [expect([NSNumber numberWithInt: [controller.availablePegs count]])
                     toBeEqualTo: [NSNumber numberWithInt: 4]];
                }),
             nil);
    
    describe(@"clicking a peg",
             beforeEach(
                ^{
                    controller = [MMAvailablePegsViewController new];
                    clickedPeg = [MMCodePeg pegWithColor: @"red"];
                }),
             it(@"sets the activePeg to the clicked peg",
                ^{
                    [controller clickPeg: clickedPeg];
                    
                    [expect(controller.activePeg) toBeEqualTo: clickedPeg];
                }),
             it(@"deactivates the previously clicked peg",
                ^{
                    MMCodePeg* secondPeg = [MMCodePeg pegWithColor: @"blue"];
                    [controller clickPeg: clickedPeg];
                    [controller clickPeg: secondPeg];
                    
                    expectFalse(clickedPeg.isActive);
                }),
             it(@"activates the peg",
                ^{
                    [controller clickPeg: clickedPeg];

                    expectTruth(clickedPeg.isActive);
                }),
             it(@"clicking the already active peg deactivates the peg",
                ^{
                    [controller clickPeg: clickedPeg];
                    [controller clickPeg: clickedPeg];
                    
                    expectFalse(clickedPeg.isActive);
                }),
             it(@"clicking the already active peg clears the activePeg",
                ^{
                    [controller clickPeg: clickedPeg];
                    [controller clickPeg: clickedPeg];
                    
                    expectTruth(controller.activePeg == NULL);
                }),
             nil);
}