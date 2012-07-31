#import <UIKit/UIKit.h>

@interface MMAvailablePeg : UIButton {
    NSString* color;
    BOOL isActive;
}
@property (nonatomic, retain) NSString* color;
@property (readwrite, assign) BOOL isActive;;

+(id) pegWithColor:(NSString*) givenColor;

-(void) activate;
-(void) deactivate;

@end
