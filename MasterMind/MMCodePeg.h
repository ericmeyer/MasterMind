#import <UIKit/UIKit.h>

@interface MMCodePeg : UIButton {
    NSString* color;
    BOOL isActive;
}
@property (nonatomic, retain) NSString* color;
@property (readwrite, assign) BOOL isActive;;

+(id) pegWithColor:(NSString*) givenColor;

-(void) changeColor:(NSString*) newColor;

-(void) activate;
-(void) deactivate;

@end
