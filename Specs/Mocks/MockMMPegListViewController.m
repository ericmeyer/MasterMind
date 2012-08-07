#import "MockMMPegListViewController.h"
#import "ConciseKit.h"

@implementation MockMMPegListViewController

@synthesize pegList, availablePegsController;

+(id) mockListWithPegs:(NSString *) pegString {
    MockMMPegListViewController* list = [MockMMPegListViewController new];
    list.pegList = [pegString $chars];
    return list;
}

@end
