#import <OCDSpec2/OCDSpec2.h>
#import <QuartzCore/QuartzCore.h>
#import "MMAvailableColor.h"

UIImage* imageForColor(MMAvailableColor* givenColor);
UIImage* imageForColor(MMAvailableColor* givenColor) {
    return [givenColor imageForState: UIControlStateNormal];
}
OCDSpec2Context(MMAvailableColorSpec) {
    
    __block MMAvailableColor* color;
    
    Describe(@"colorWithName", ^{
        
        BeforeEach(^{
            color = [MMAvailableColor colorWithName: @"orange"];
        });
        
        It(@"has a name", ^{
            [ExpectObj(color.name) toBe: @"orange"];
        });
        
        It(@"has an image", ^{
            UIImage* expectedImage = [UIImage imageNamed: @"square_orange_peg.png"];
            
            [ExpectObj(imageForColor(color)) toExist];
            [ExpectObj(imageForColor(color)) toBeEqualTo: expectedImage];
        });
        
        It(@"is inactive", ^{
            [ExpectBool(color.isActive) toBeFalse];
        });
        
    });

    Describe(@"activate", ^{
        
        BeforeEach(^{
            color = [MMAvailableColor colorWithName: @"red"];
        });
        
        It(@"sets the peg to be active", ^{
            [color activate];
            
            [ExpectBool(color.isActive) toBeTrue];
        });
        
        It(@"updates the border width", ^{
            [color activate];
            
            [ExpectFloat([[color layer] borderWidth]) toBe: 2.0 withPrecision: 0.01];
        });
        
    });

    Describe(@"deactivate", ^{
        
        BeforeEach(^{
            color = [MMAvailableColor colorWithName: @"red"];
            [color activate];
        });
        
        It(@"sets the peg to be inactive", ^{
            [color deactivate];
            
            [ExpectBool(color.isActive) toBeFalse];
        });
        
        It(@"updates the border width", ^{
            [color deactivate];
            
            [ExpectFloat([[color layer] borderWidth]) toBe: 0.0 withPrecision: 0.01];
        });
        
    });
    
}