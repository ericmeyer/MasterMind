#import <Foundation/Foundation.h>
#import "MMCode.h"

@interface GuessChecker : NSObject {
    NSString* code;
    NSString* guess;
    MMCode* mmCode;
}
@property (nonatomic, retain) NSString* code;
@property (nonatomic, retain) NSString* guess;
@property (nonatomic, retain) MMCode* mmCode;


@end
