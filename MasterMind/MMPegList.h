#import <Foundation/Foundation.h>
#import "MMAvailablePegsViewController.h"

@protocol MMPegList <NSObject>

@property (nonatomic, strong) MMAvailablePegsViewController* availablePegsController;

-(NSArray*) pegList;

@end
