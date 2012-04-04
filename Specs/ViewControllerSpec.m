#import "OCDSpec/OCDSpec.h"
#import "ViewController.h"

CONTEXT(ViewControllerSpec)
{
    __block ViewController* controller;
    
    describe(@"ViewController",
             beforeEach(^{
                    controller = [[ViewController alloc] init];
                    controller.numberCorrect = [[UILabel alloc] init];
                    controller.numberInWrongSpot = [[UILabel alloc] init];
                    controller.secretCode = [[UITextField alloc] init];
                    controller.guess = [[UITextField alloc] init];
                }),
             it(@"sets the number correct to empty on viewDidLoad",
                ^{
                    [controller viewDidLoad];
                    
                    [expect(controller.numberCorrect.text) toBeEqualTo: @""];
                }),
             it(@"sets the number in wrong spot on viewDidLoad",
                ^{
                    [controller viewDidLoad];
                    
                    [expect(controller.numberInWrongSpot.text) toBeEqualTo: @""];
                }),
             it(@"has a secret code",
                ^{
                    [controller viewDidLoad];
                    
                    [expect(controller.secretCode.text) toBeEqualTo: @"YGRB"];
                }),
             it(@"has a guess",
                ^{
                    [controller viewDidLoad];

                    [expect(controller.guess.text) toBeEqualTo: @"GGGG"];
                }),
             nil);
    
    describe(@"taking a guess",
             beforeEach(^{
                    controller = [[ViewController alloc] init];
                }),
             it(@"uses the guess validator for the number correct",
                ^{
                    
                }),
             nil);
}