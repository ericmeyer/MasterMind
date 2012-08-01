#import "MMCodePeg.h"

@interface MMCodePeg (private)
-(void) setImage:(NSString*) imageName;
@end

@implementation MMCodePeg

@synthesize color, isActive;

+(id) pegWithColor:(NSString*) givenColor {
    MMCodePeg* peg = [[MMCodePeg new] autorelease];
    [peg setColor: givenColor];
    [peg deactivate];
    return peg;
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
