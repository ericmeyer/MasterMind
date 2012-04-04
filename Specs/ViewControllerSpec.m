#import "OCDSpec/OCDSpec.h"
#import "ViewController.h"

CONTEXT(ViewControllerSpec)
{
    __block ViewController* controller;
    
    describe(@"guess labels on load",
             beforeEach(^{
                    controller = [[ViewController alloc] init];
                    controller.numberCorrect = [[UILabel alloc] init];
                    controller.numberInWrongSpot = [[UILabel alloc] init];
                }),
             it(@"has nothing for numberCorrect",
                ^{
                    [controller viewDidLoad];
                    
                    [expect(controller.numberCorrect.text) toBeEqualTo: @""];
                }),
             it(@"has nothing for numberInWrongSpot",
                ^{
                    [controller viewDidLoad];
                    
                    [expect(controller.numberInWrongSpot.text) toBeEqualTo: @""];
                }),
             nil);
}