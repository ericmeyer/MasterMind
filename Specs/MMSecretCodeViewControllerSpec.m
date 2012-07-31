#import "OCDSpec/OCDSpec.h" 
#import "MMSecretCodeViewController.h"
#import "MMAvailablePegsViewController.h"

CONTEXT(MMSecretCodeViewControllerSpec)
{
    __block MMSecretCodeViewController* controller;
    __block MMAvailablePegsViewController* availablePegs;
    
    describe(@"on init",
             beforeEach(
                ^{
                    controller = [MMSecretCodeViewController new];
                    controller.pegOne = [UIButton new];
                    controller.pegTwo = [UIButton new];
                }),
             it(@"starts with no pegOne",
                ^{                    
                    expectTruth(controller.pegOne.titleLabel.text == NULL);
                }),
             it(@"starts with no pegTwo",
                ^{
                    expectTruth(controller.pegTwo.titleLabel.text == NULL);
                }),
             nil);
    
    describe(@"clicking pegOne",
             beforeEach(
                ^{
                    controller = [MMSecretCodeViewController new];
                    controller.pegOne = [UIButton new];
                    controller.pegTwo = [UIButton new];
                    availablePegs = [MMAvailablePegsViewController new];
                    controller.availablePegsController = availablePegs;
                }),
             it(@"sets pegOne to the activePeg from the available pegs",
                ^{
                    availablePegs.activePeg = @"Y";
                    
                    [controller touchPegOne];
                    
                    [expect(controller.pegOne.titleLabel.text) toBeEqualTo: @"Y"];
                }),
             it(@"does not clear pegOne if there is no activePeg",
                ^{
                    controller.pegOne.titleLabel.text = @"B";
                    availablePegs.activePeg = NULL;
                    
                    [controller touchPegOne];
                    
                    [expect(controller.pegOne.titleLabel.text) toBeEqualTo: @"B"];
                }),
             nil);
    
    describe(@"clicking pegTwo",
             beforeEach(
                ^{
                    controller = [MMSecretCodeViewController new];
                    controller.pegOne = [UIButton new];
                    controller.pegTwo = [UIButton new];
                    availablePegs = [MMAvailablePegsViewController new];
                    controller.availablePegsController = availablePegs;
                }),
             it(@"sets pegTwo to the activePeg from the available pegs",
                ^{
                    availablePegs.activePeg = @"Y";
                    
                    [controller touchPegTwo];
                    
                    [expect(controller.pegTwo.titleLabel.text) toBeEqualTo: @"Y"];
                }),
             it(@"does not clear pegTwo if there is no activePeg",
                ^{
                    controller.pegTwo.titleLabel.text = @"B";
                    availablePegs.activePeg = NULL;
                    
                    [controller touchPegTwo];
                    
                    [expect(controller.pegTwo.titleLabel.text) toBeEqualTo: @"B"];
                }),
             nil);
    
}