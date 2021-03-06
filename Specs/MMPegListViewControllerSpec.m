#import <OCDSpec2/OCDSpec2.h>
#import "MMPegListViewController.h"
#import "MMAvailableColorsViewController.h"
#import "ConciseKit.h"

OCDSpec2Context(MMPegListViewControllerSpec) {
    
    __block MMPegListViewController* controller;
    __block MMAvailableColorsViewController* availableColors;
    
    Describe(@"on init", ^{
        
        BeforeEach(^{
            controller = [MMPegListViewController new];
        });
        
        It(@"starts with 4 pegs", ^{
            [ExpectObj([NSNumber numberWithInt: [controller.pegs count]])
             toBeEqualTo: [NSNumber numberWithInt: 4]];
        });
        
        It(@"adds the touchPeg target to each", ^{
            [controller.pegs $each:^(id obj){
                MMCodePeg* peg = (MMCodePeg*)obj;
                NSArray* actualActions = [peg actionsForTarget: controller
                                               forControlEvent: UIControlEventTouchUpInside];
                NSArray* expectedActions = $arr(@"touchPeg:");
                
                [ExpectObj(expectedActions) toBeEqualTo: actualActions];
            }];
        });
        
    });
    
    Describe(@"viewDidLoad", ^{
        
        BeforeEach(^{
            controller = [[MMPegListViewController alloc]  initWithNibName: nil
                                                                    bundle: nil];
            [controller viewDidLoad];
        });
        
        It(@"adds the pegs as subviews", ^{
            int count = [controller.view.subviews count];
            NSNumber* numberOfSubviews = [NSNumber numberWithInt: count];
            
            [ExpectObj(numberOfSubviews) toBeEqualTo: [NSNumber numberWithInt: 5]];
        });
        
    });
    
    Describe(@"touchPeg", ^{
        
        BeforeEach(^{
            controller = [MMPegListViewController new];
            availableColors = [MMAvailableColorsViewController new];
            controller.availableColorsController = availableColors;
        });
        
        It(@"changes the touched peg's color to the active color", ^{
            MMCodePeg* touchedPeg = [controller.pegs objectAtIndex: 2];
            availableColors.activeColor = [MMAvailableColor colorWithName: @"blue"];
            [controller touchPeg: touchedPeg];
            
            [ExpectObj(touchedPeg.color) toBeEqualTo: @"blue"];
        });
        
        It(@"does nothing if there is no active color", ^{
            MMCodePeg* touchedPeg = [controller.pegs objectAtIndex: 2];
            availableColors.activeColor = [MMAvailableColor colorWithName: @"blue"];
            [controller touchPeg: touchedPeg];
            availableColors.activeColor = NULL;
            [controller touchPeg: touchedPeg];
            
            [ExpectObj(touchedPeg.color) toBeEqualTo: @"blue"];
        });
        
    });
    
    Describe(@"code", ^{
        BeforeEach(^{
            controller = [MMPegListViewController new];
        });
        
        It(@"has a code with all colors set", ^{
            [[controller.pegs objectAtIndex: 0] changeColor: @"red"];
            [[controller.pegs objectAtIndex: 1] changeColor: @"orange"];
            [[controller.pegs objectAtIndex: 2] changeColor: @"blue"];
            [[controller.pegs objectAtIndex: 3] changeColor: @"yellow"];
            
            [ExpectObj([controller pegList]) toBeEqualTo: $arr(@"red", @"orange", @"blue", @"yellow")];
        });
        
        It(@"has no code with some unset colors", ^{
            [[controller.pegs objectAtIndex: 0] changeColor: @"red"];
            [[controller.pegs objectAtIndex: 1] changeColor: @"orange"];
            [[controller.pegs objectAtIndex: 3] changeColor: @"yellow"];
            
            [ExpectObj([controller pegList]) toBeNil];
        });
        
    });
    
}