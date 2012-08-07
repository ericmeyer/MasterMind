#import <SpecKit/SpecKit.h>
#import "MMGuessResult.h"

SpecKitContext(MMGuessResultSpec) {
    
    Describe(@"attributes", ^{
        
        It(@"has a numberCorrect", ^{
            MMGuessResult* result;
            result = [MMGuessResult new];
            result.numberCorrect = [NSNumber numberWithInt: 5];
            [ExpectInt([result.numberCorrect intValue]) toBe: 5];
        });
        
        It(@"has a numberInWrongSpot", ^{
            MMGuessResult* result;
            result = [MMGuessResult new];
            result.numberInWrongSpot = [NSNumber numberWithInt: 123];
            [ExpectInt([result.numberInWrongSpot intValue]) toBe: 123];
        });
        
    });
    
}
