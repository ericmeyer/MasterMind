#import <Foundation/Foundation.h>

@interface GuessChecker : NSObject {
    NSString* code;
    NSString* guess;
}
@property (nonatomic, retain) NSString* code;
@property (nonatomic, retain) NSString* guess;

@end
