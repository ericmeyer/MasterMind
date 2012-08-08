#import <UIKit/UIKit.h>

@interface MMCodePeg : UIButton {
    NSString* color;
    BOOL isActive;
}
@property (nonatomic, strong) NSString* color;
@property (readwrite, assign) BOOL isActive;;

+(id) pegWithColor:(NSString*) givenColor;
+(id) emptyPeg;

-(void) changeColor:(NSString*) newColor;

-(void) activate;
-(void) deactivate;

@end
