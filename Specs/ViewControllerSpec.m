#import "OCDSpec/OCDSpec.h"
#import "ViewController.h"

CONTEXT(ViewControllerSpec)
{
    __block ViewController* controller;
    
    describe(@"ViewController",
             beforeEach(^{
                    controller = [[[ViewController alloc] init] autorelease];
                    controller.numberCorrect = [[[UILabel alloc] init] autorelease];
                    controller.numberInWrongSpot = [[[UILabel alloc] init] autorelease];
                    controller.secretCode = [[[UITextField alloc] init] autorelease];
                    controller.guess = [[[UITextField alloc] init] autorelease];
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
                    controller = [[[ViewController alloc] init] autorelease];
                    controller.numberCorrect = [[[UILabel alloc] init] autorelease];
                    controller.numberInWrongSpot = [[[UILabel alloc] init] autorelease];
                    controller.secretCode = [[[UITextField alloc] init] autorelease];
                    controller.guess = [[[UITextField alloc] init] autorelease];
                }),
             it(@"sets the number correct",
                ^{
                    controller.secretCode.text = @"YYRR";
                    controller.guess.text = @"YYYY";
                    
                    [controller takeGuess];
                    
                    [expect(controller.numberCorrect.text) toBeEqualTo: @"2"];
                }),
             it(@"sets the number in the wrong spot",
                ^{
                    controller.secretCode.text = @"YRGG";
                    controller.guess.text = @"RGYG";
                    
                    [controller takeGuess];
                    
                    [expect(controller.numberInWrongSpot.text) toBeEqualTo: @"3"];
                }),
             nil);
}