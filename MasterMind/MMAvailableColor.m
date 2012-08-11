#import "MMAvailableColor.h"
#import <QuartzCore/QuartzCore.h>

@interface MMAvailableColor (private)
-(void) setImage:(NSString*) imageName;
@end

@implementation MMAvailableColor

@synthesize name, isActive;

+(id) colorWithName:(NSString*) givenName {
    MMAvailableColor* availableColor = [MMAvailableColor new];
    [[availableColor layer] setBorderColor: [[UIColor whiteColor] CGColor]];
    availableColor.name = givenName;
    [availableColor setImage: [NSString stringWithFormat: @"square_%@_peg.png", availableColor.name]];
    return availableColor;
}

-(void) activate {
    [self setIsActive: YES];
    [[self layer] setBorderWidth: 2.0];
}

-(void) deactivate {
    [self setIsActive: NO];
    [[self layer] setBorderWidth: 0.0];
}

-(void) setImage:(NSString*) imageName {
    UIImage* image = [UIImage imageNamed: imageName];
    [self setImage: image forState: UIControlStateNormal];
}

@end
