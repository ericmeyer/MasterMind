#import <UIKit/UIKit.h>

FOUNDATION_EXPORT float const PEG_SIDE_LENGTH;

@interface MMCodePeg : UIButton {
    NSString* color;
    BOOL isActive;
}
@property (nonatomic, strong) NSString* color;
@property (readwrite, assign) BOOL isActive;;

+(id) pegWithColorName:(NSString*) givenColorName;
+(id) emptyPeg;

-(void) changeColor:(NSString*) newColor;

@end
