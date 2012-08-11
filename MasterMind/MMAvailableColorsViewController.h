#import <UIKit/UIKit.h>
#import "MMCodePeg.h"
#import "MMAvailableColor.h"

@interface MMAvailableColorsViewController : UIViewController {
    NSMutableArray* availableColors;
    MMAvailableColor* activeColor;
}
@property (nonatomic, strong) NSMutableArray* availableColors;
@property (nonatomic, strong) MMAvailableColor* activeColor;

-(IBAction) clickPeg:(id) sender;

@end
