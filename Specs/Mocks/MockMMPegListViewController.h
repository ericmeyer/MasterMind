#import <Foundation/Foundation.h>
#import "MMPegList.h"

@interface MockMMPegListViewController : UIViewController<MMPegList> {
    NSArray* pegList;
}
@property(nonatomic, strong) NSArray* pegList;

+(id) mockListWithPegs:(NSString*) pegString;

@end
