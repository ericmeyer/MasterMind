#import "OCDSpec/OCDSpec.h"
#import "MMCode.h"

CONTEXT(MMCode)
{
    describe(@"toBeFailing",
             it(@"is a failling test",
                ^{
                    expectTruth(false);
                }),
             
             nil); // Don't forget the terminating nil
}