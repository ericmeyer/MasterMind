#import "OCDSpec/OCDSpec.h"
#import "MMAvailablePeg.h"

CONTEXT(MMAvailablePegSpec)
{
    __block MMAvailablePeg* peg;
    
    describe(@"pegWithColor",
             beforeEach(
                ^{
                    peg = [MMAvailablePeg pegWithColor: @"red"];
                }),
             it(@"sets the color",
                ^{
                    [expect(peg.color) toBeEqualTo: @"red"];
                }),
             it(@"uses the color to set the background image",
                ^{
                    UIImage* expectedImage = [UIImage imageNamed: @"red_peg.png"];
                    UIImage* actualImage = [peg imageForState: UIControlStateNormal];

                    expectFalse(actualImage == NULL);
                    [expect(actualImage) toBeEqualTo: expectedImage];
                }),
             it(@"starts inactive",
                ^{
                    expectFalse(peg.isActive);
                }),
             nil);
    
    describe(@"activate",
             beforeEach(
                ^{
                    peg = [MMAvailablePeg pegWithColor: @"red"];
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
                    UIImage* actualImage = [peg imageForState: UIControlStateNormal];
                    
                    expectFalse(actualImage == NULL);
                    [expect(actualImage) toBeEqualTo: expectedImage];
                }),
             nil);

    describe(@"deactivate",
             beforeEach(
                ^{
                    peg = [MMAvailablePeg pegWithColor: @"red"];
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
                    UIImage* actualImage = [peg imageForState: UIControlStateNormal];
                    
                    expectFalse(actualImage == NULL);
                    [expect(actualImage) toBeEqualTo: expectedImage];
                }),
             nil);
}