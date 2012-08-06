#import <SpecKit/SpecKit.h>
#import "ViewController.h"

SpecKitContext(ViewControllerSpec) {
    
    __block ViewController* controller;
    
    BeforeEach(^{
        controller = [[ViewController alloc] init];
        controller.numberCorrect = [[UILabel alloc] init];
        controller.numberInWrongSpot = [[UILabel alloc] init];
        controller.secretCode = [[UITextField alloc] init];
        controller.guess = [[UITextField alloc] init];
    });
    
    Describe(@"ViewController", ^{
        
        It(@"sets the number correct to empty on viewDidLoad", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberCorrect.text) toBeEqualTo: @""];
        });
        
        It(@"sets the number in wrong spot on viewDidLoad", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.numberInWrongSpot.text) toBeEqualTo: @""];
        });
        
        It(@"has a secret code", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.secretCode.text) toBeEqualTo: @"YGRB"];
        });
        
        It(@"has a guess", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.guess.text) toBeEqualTo: @"GGGG"];
        });
        
        It(@"has a secrect code view controller", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.secretCodeViewController) toExist];
        });
        
        It(@"has a guess view controller", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.guessViewController) toExist];
        });
        
        It(@"has an available pegs view controller", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.availablePegsViewController) toExist];
        });
        
        It(@"sets the secret code's availablePegs", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.secretCodeViewController.availablePegsController)
             toBeEqualTo: controller.availablePegsViewController];
        });
        
        It(@"sets the guess' availablePegs", ^{
            [controller viewDidLoad];
            
            [ExpectObj(controller.guessViewController.availablePegsController)
             toBeEqualTo: controller.availablePegsViewController];
        });
        
    });
    
    Describe(@"taking a guess", ^{
        
        It(@"sets the number correct", ^{
            controller.secretCode.text = @"YYRR";
            controller.guess.text = @"YYYY";
            
            [controller takeGuess];
            
            [ExpectObj(controller.numberCorrect.text) toBeEqualTo: @"2"];
        });
        
        It(@"sets the number in the wrong spot", ^{
            controller.secretCode.text = @"YRGG";
            controller.guess.text = @"RGYG";
            
            [controller takeGuess];
            
            [ExpectObj(controller.numberInWrongSpot.text) toBeEqualTo: @"3"];
        });
        
    });
}