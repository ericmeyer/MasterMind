#import "OCDSpec/OCDSpec.h" 
#import "MMSecretCodeViewController.h"
#import "MMAvailablePegsViewController.h"

CONTEXT(MMSecretCodeViewControllerSpec)
{
    __block MMSecretCodeViewController* controller;
    __block MMAvailablePegsViewController* availablePegs;
    
    describe(@"on init",
             it(@"starts with no pegOne",
                ^{
                    controller = [MMSecretCodeViewController new];
                    
                    expectTruth(controller.pegOne == NULL);
                }),
             it(@"starts with no pegTwo",
                ^{
                    controller = [MMSecretCodeViewController new];
                    
                    expectTruth(controller.pegTwo == NULL);
                }),
             nil);
    
    describe(@"clicking pegOne",
             beforeEach(
                ^{
                    controller = [MMSecretCodeViewController new];
                    availablePegs = [MMAvailablePegsViewController new];
                    controller.availablePegsController = availablePegs;
                }),
             it(@"sets pegOne to the activePeg from the available pegs",
                ^{
                    availablePegs.activePeg = @"Y";
                    
                    [controller touchPegOne];
                    
                    [expect(controller.pegOne) toBeEqualTo: @"Y"];
                }),
             it(@"does not clear pegOne if there is no activePeg",
                ^{
                    controller.pegOne = @"B";
                    availablePegs.activePeg = NULL;
                    
                    [controller touchPegOne];
                    
                    [expect(controller.pegOne) toBeEqualTo: @"B"];
                }),
             nil);
    
    describe(@"clicking pegTwo",
             beforeEach(
                ^{
                    controller = [MMSecretCodeViewController new];
                    availablePegs = [MMAvailablePegsViewController new];
                    controller.availablePegsController = availablePegs;
                }),
             it(@"sets pegTwo to the activePeg from the available pegs",
                ^{
                    availablePegs.activePeg = @"Y";
                    
                    [controller touchPegTwo];
                    
                    [expect(controller.pegTwo) toBeEqualTo: @"Y"];
                }),
             it(@"does not clear pegTwo if there is no activePeg",
                ^{
                    controller.pegTwo = @"B";
                    availablePegs.activePeg = NULL;
                    
                    [controller touchPegTwo];
                    
                    [expect(controller.pegTwo) toBeEqualTo: @"B"];
                }),
             nil);
    
}