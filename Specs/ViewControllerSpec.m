#import "OCDSpec/OCDSpec.h"
#import "ViewController.h"

CONTEXT(ViewControllerSpec)
{
    describe(@"guess labels on load",
             it(@"has nothing for numberCorrect",
                ^{
                    ViewController* controller = [[ViewController alloc] init];
                    [controller viewDidLoad];
                    
                    [expect(controller.numberCorrect.text) toBeEqualTo: @""];
                }),
             
             nil); // Don't forget the terminating nil
}