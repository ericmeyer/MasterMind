#import <Foundation/Foundation.h>
#import "MMAvailableColorsViewController.h"

@protocol MMPegList <NSObject>

@property (nonatomic, strong) MMAvailableColorsViewController* availableColorsController;

-(NSArray*) pegList;

@end
