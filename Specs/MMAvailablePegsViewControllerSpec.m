#import "OCDSpec/OCDSpec.h"
#import "MMAvailablePegsViewController.h"

CONTEXT(MMAvailablePegsViewControllerSpec)
{
    __block MMAvailablePegsViewController* controller;
    __block UIButton* clickedPeg;
    
    describe(@"on init",
             it(@"has no activePeg",
                ^{
                    controller = [MMAvailablePegsViewController new];
                    [expect(controller.activePegString) toBe: NULL];
                }),
             nil);
    
    describe(@"clicking a peg",
             beforeEach(
                ^{
                    controller = [MMAvailablePegsViewController new];
                    controller.activePegLabel = [UILabel new];
                    clickedPeg = [[UIButton alloc] init];
                }),
             it(@"sets the active peg to the tag of the given peg",
                ^{
                    clickedPeg.tag = 123;
                    [controller clickPeg: clickedPeg];
                    
                    [expect(controller.activePegString) toBeEqualTo: @"123"];
                }),
             it(@"sets the active peg label to the tag of the given peg",
                ^{
                    clickedPeg.tag = 123;
                    [controller clickPeg: clickedPeg];
                    
                    [expect(controller.activePegLabel.text) toBeEqualTo: @"123"];
                }),
             it(@"clears the activePeg if the current peg is clicked",
                ^{
                    clickedPeg.tag = 123;
                    controller.activePegString = @"123";
                    [controller clickPeg: clickedPeg];
                    
                    [expect(controller.activePegString) toBe: NULL];
                }),
             it(@"set the activePeg if the active peg is different from the clicked peg",
                ^{
                    clickedPeg.tag = 123;
                    [controller clickPeg: clickedPeg];
                    clickedPeg.tag = 456;
                    [controller clickPeg: clickedPeg];
                    
                    [expect(controller.activePegString) toBeEqualTo: @"456"];
                }),
             nil);
}