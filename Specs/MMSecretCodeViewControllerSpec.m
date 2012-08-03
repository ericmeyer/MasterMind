#import "OCDSpec/OCDSpec.h" 
#import "MMSecretCodeViewController.h"
#import "MMAvailablePegsViewController.h"
#import "ConciseKit.h"

CONTEXT(MMSecretCodeViewControllerSpec)
{
    __block MMSecretCodeViewController* controller;
    __block MMAvailablePegsViewController* availablePegs;
    
    describe(@"on init",
             beforeEach(
                ^{
                    controller = [MMSecretCodeViewController new];
                }),
             it(@"starts with 4 pegs",
                ^{
                    [expect([NSNumber numberWithInt: [controller.pegs count]])
                     toBeEqualTo: [NSNumber numberWithInt: 4]];
                }),
             it(@"adds the touchPeg target to each",
                ^{
                    [controller.pegs $each:^(id obj){
                        MMCodePeg* peg = (MMCodePeg*)obj;
                        NSArray* actualActions = [peg actionsForTarget: controller
                                                       forControlEvent: UIControlEventTouchUpInside];
                        NSArray* expectedActions = $arr(@"touchPeg:");
                        
                        [expect(expectedActions) toBeEqualTo: actualActions];
                    }];
                }),
             nil);
    
    describe(@"viewDidLoad",
             beforeEach(
                ^{
                    controller = [[MMSecretCodeViewController alloc]  initWithNibName: nil
                                                                               bundle: nil];
                    [controller viewDidLoad];
                }),
             it(@"adds the pegs as subviews",
                ^{
                    int count = [controller.view.subviews count];
                    NSNumber* numberOfSubviews = [NSNumber numberWithInt: count];

                    [expect(numberOfSubviews) toBeEqualTo: [NSNumber numberWithInt: 4]];
                }),
             nil);
    
    describe(@"touchPeg",
             beforeEach(
                ^{
                    controller = [MMSecretCodeViewController new];
                    availablePegs = [MMAvailablePegsViewController new];
                    controller.availablePegsController = availablePegs;
                }),
             it(@"changes the touched peg's color to the activePeg's color",
                ^{
                    MMCodePeg* touchedPeg = [controller.pegs objectAtIndex: 2];
                    availablePegs.activePeg = [MMCodePeg pegWithColor: @"blue"];
                    [controller touchPeg: touchedPeg];
                    
                    [expect(touchedPeg.color) toBeEqualTo: @"blue"];
                }),
             nil);
    
}