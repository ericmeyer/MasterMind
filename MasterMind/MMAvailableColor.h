#import <UIKit/UIKit.h>

@interface MMAvailableColor : UIButton {
    NSString* name;
    BOOL isActive;
}
@property (nonatomic, strong) NSString* name;
@property (readwrite, assign) BOOL isActive;;

+(id) colorWithName:(NSString*) givenName;

-(void) activate;
-(void) deactivate;

@end
