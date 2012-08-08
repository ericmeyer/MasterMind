#import "MMCodePeg.h"

@interface MMCodePeg (private)
-(void) setImage:(NSString*) imageName;
@end

@implementation MMCodePeg

@synthesize color, isActive;

+(id) pegWithColor:(NSString*) givenColor {
    MMCodePeg* peg = [MMCodePeg new];
    [peg changeColor: givenColor];
    return peg;
}

+(id) emptyPeg {
    MMCodePeg* peg = [MMCodePeg new];
    [peg setImage: @"empty_peg"];
    return peg;
}

-(void) changeColor:(NSString*) newColor {
    self.color = newColor;
    [self setImage: [NSString stringWithFormat: @"%@_peg.png", self.color]];
}

-(void) activate {
    [self setImage: [NSString stringWithFormat: @"%@_peg_active.png", self.color]];
    [self setIsActive: YES];
}

-(void) deactivate {
    [self setImage: [NSString stringWithFormat: @"%@_peg.png", self.color]];
    [self setIsActive: NO];
}

-(void) setImage:(NSString*) imageName {
    UIImage* image = [UIImage imageNamed: imageName];
    [self setImage: image forState: UIControlStateNormal];
}

@end
