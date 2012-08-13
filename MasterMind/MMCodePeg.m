#import "MMCodePeg.h"
#import <QuartzCore/QuartzCore.h>

float const PEG_SIDE_LENGTH=63;

@interface MMCodePeg (private)
-(void) setImage:(NSString*) imageName;
@end

@implementation MMCodePeg

+(id) pegWithColorName:(NSString*) givenColorName {
    MMCodePeg* peg = [MMCodePeg new];
    [[peg layer] setBorderColor: [[UIColor whiteColor] CGColor]];
    peg.color = givenColorName;
    [peg setImage: [NSString stringWithFormat: @"round_%@_peg.png", peg.color]];
    return peg;
}

+(id) emptyPeg {
    MMCodePeg* peg = [MMCodePeg new];
    [peg setImage: @"empty_peg"];
    return peg;
}

-(void) changeColor:(NSString*) newColor {
    self.color = newColor;
    [self setImage: [NSString stringWithFormat: @"round_%@_peg.png", self.color]];
}

-(void) setImage:(NSString*) imageName {
    UIImage* image = [UIImage imageNamed: imageName];
    [self setImage: image forState: UIControlStateNormal];
    [self setImage: image forState: UIControlStateDisabled];
}

@end
