#import <SpecKit/SpecKit.h>
#import <QuartzCore/QuartzCore.h>
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
            [ExpectObj(imageFor(peg)) toExist];
        });

        It(@"is inactive", ^{
            [ExpectBool(peg.isActive) toBeFalse];
        });

    });

    Describe(@"pegWithColor", ^{

        BeforeEach(^{
            peg = [MMCodePeg pegWithColorName: @"red"];
        });

        It(@"sets the color", ^{
            [ExpectObj(peg.color) toBeEqualTo: @"red"];
        });

        It(@"uses the color to set the background image", ^{
            UIImage* expectedImage = [UIImage imageNamed: @"round_red_peg.png"];

            [ExpectObj(imageFor(peg)) toExist];
            [ExpectObj(imageFor(peg)) toBeEqualTo: expectedImage];
        });

        It(@"starts inactive", ^{
            [ExpectBool(peg.isActive) toBeFalse];
        });

    });

    Describe(@"changeColor", ^{

        BeforeEach(^{
            peg = [MMCodePeg pegWithColorName: @"red"];
        });

        It(@"changes the color to blue", ^{
            [peg changeColor: @"blue"];

            [ExpectObj(peg.color) toBeEqualTo: @"blue"];
        });

        It(@"changes the image", ^{
            UIImage* originalImage = [peg imageForState: UIControlStateNormal];
            [peg changeColor: @"blue"];

            [ExpectObj(imageFor(peg)) toExist];
            [ExpectBool(imageFor(peg) == originalImage) toBeFalse];
        });

    });

}