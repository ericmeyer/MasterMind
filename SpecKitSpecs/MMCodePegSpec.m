#import <SpecKit/SpecKit.h>
#import "MMCodePeg.h"

UIImage* imageFor(MMCodePeg* givenPeg);
UIImage* imageFor(MMCodePeg* givenPeg) {
    return [givenPeg imageForState: UIControlStateNormal];
}
SpecKitContext(MMCodePegSpec) {
    
    __block MMCodePeg* peg;
    
    Describe(@"pegWithColor", ^{
        
        BeforeEach(^{
            peg = [MMCodePeg emptyPeg];
        });
        
        It(@"has no color", ^{
            [ExpectObj(peg.color) toBe: NULL];
        });
        
        It(@"has an image", ^{
            [ExpectBool(imageFor(peg) == NULL) toBeFalse];
        });
        
        It(@"is inactive", ^{
            [ExpectBool(peg.isActive) toBeFalse];
        });
        
    });
    
    Describe(@"pegWithColor", ^{
        
        BeforeEach(^{
            peg = [MMCodePeg pegWithColor: @"red"];
        });
        
        It(@"sets the color", ^{
            [ExpectObj(peg.color) toBeEqualTo: @"red"];
        });
        
        It(@"uses the color to set the background image", ^{
            UIImage* expectedImage = [UIImage imageNamed: @"red_peg.png"];
            
            [ExpectBool(imageFor(peg) == NULL) toBeFalse];
            [ExpectObj(imageFor(peg)) toBeEqualTo: expectedImage];
        });
        
        It(@"starts inactive", ^{
            [ExpectBool(peg.isActive) toBeFalse];
        });
        
    });
    
    Describe(@"activate", ^{
        
        BeforeEach(^{
            peg = [MMCodePeg pegWithColor: @"red"];
        });
        
        It(@"sets the peg to be active", ^{
            [peg activate];
            
            [ExpectBool(peg.isActive) toBeTrue];
        });
        
        It(@"updates the image", ^{
            [peg activate];
            UIImage* expectedImage = [UIImage imageNamed: @"red_peg_active.png"];
            
            [ExpectBool(imageFor(peg) == NULL) toBeFalse];
            [ExpectObj(imageFor(peg)) toBeEqualTo: expectedImage];
        });
        
    });
    
    Describe(@"deactivate", ^{
        
        BeforeEach(^{
            peg = [MMCodePeg pegWithColor: @"red"];
            [peg activate];
        });
        
        It(@"sets the peg to be inactive", ^{
            [peg deactivate];
            
            [ExpectBool(peg.isActive) toBeFalse];
        });
        
        It(@"updates the image", ^{
            [peg deactivate];
            UIImage* expectedImage = [UIImage imageNamed: @"red_peg.png"];
            
            [ExpectBool(imageFor(peg) == NULL) toBeFalse];
            [ExpectObj(imageFor(peg)) toBeEqualTo: expectedImage];
        });
        
    });
    
    Describe(@"changeColor", ^{
        
        BeforeEach(^{
            peg = [MMCodePeg pegWithColor: @"red"];
        });
        
        It(@"changes the color to blue", ^{
            [peg changeColor: @"blue"];
            
            [ExpectObj(peg.color) toBeEqualTo: @"blue"];
        });
        
        It(@"changes the image", ^{
            UIImage* originalImage = [peg imageForState: UIControlStateNormal];
            [peg changeColor: @"blue"];
            
            [ExpectBool(imageFor(peg) == NULL) toBeFalse];
            [ExpectBool(imageFor(peg) == originalImage) toBeFalse];
        });
        
    });
    
}