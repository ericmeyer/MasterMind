#import "OCDSpec/OCDSpec.h"
#import "MMCodePeg.h"

UIImage* imageFor(MMCodePeg* givenPeg);
UIImage* imageFor(MMCodePeg* givenPeg) {
    return [givenPeg imageForState: UIControlStateNormal];
}
CONTEXT(MMCodePegSpec)
{
    __block MMCodePeg* peg;
    
    describe(@"pegWithColor",
             beforeEach(
                ^{
                    peg = [MMCodePeg pegWithColor: @"red"];
                }),
             it(@"sets the color",
                ^{
                    [expect(peg.color) toBeEqualTo: @"red"];
                }),
             it(@"uses the color to set the background image",
                ^{
                    UIImage* expectedImage = [UIImage imageNamed: @"red_peg.png"];

                    expectFalse(imageFor(peg) == NULL);
                    [expect(imageFor(peg)) toBeEqualTo: expectedImage];
                }),
             it(@"starts inactive",
                ^{
                    expectFalse(peg.isActive);
                }),
             nil);
    
    describe(@"activate",
             beforeEach(
                ^{
                    peg = [MMCodePeg pegWithColor: @"red"];
                }),
             it(@"sets the peg to be active",
                ^{
                    [peg activate];
                    
                    expectTruth(peg.isActive);
                }),
             it(@"updates the image",
                ^{
                    [peg activate];
                    UIImage* expectedImage = [UIImage imageNamed: @"red_peg_active.png"];
                    
                    expectFalse(imageFor(peg) == NULL);
                    [expect(imageFor(peg)) toBeEqualTo: expectedImage];
                }),
             nil);

    describe(@"deactivate",
             beforeEach(
                ^{
                    peg = [MMCodePeg pegWithColor: @"red"];
                    [peg activate];
                }),
             it(@"sets the peg to be active",
                ^{
                    [peg deactivate];
                    
                    expectFalse(peg.isActive);
                }),
             it(@"updates the image",
                ^{
                    [peg deactivate];
                    UIImage* expectedImage = [UIImage imageNamed: @"red_peg.png"];
                    
                    expectFalse(imageFor(peg) == NULL);
                    [expect(imageFor(peg)) toBeEqualTo: expectedImage];
                }),
             nil);
    
    describe(@"changeColor",
             beforeEach(
                ^{
                    peg = [MMCodePeg pegWithColor: @"red"];
                }),
             it(@"changes the color to blue",
                ^{
                    [peg changeColor: @"blue"];
                    
                    [expect(peg.color) toBeEqualTo: @"blue"];
                }),
             it(@"changes the image",
                ^{
                    UIImage* originalImage = [peg imageForState: UIControlStateNormal];
                    [peg changeColor: @"blue"];
                  
                    expectFalse(imageFor(peg) == NULL);
                    expectFalse(imageFor(peg) == originalImage);
                }),
             nil);
}