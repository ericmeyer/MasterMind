#import <SpecKit/SpecKit.h>
#import "MMGuessResult.h"
#import "ConciseKit.h"

NSArray* code(NSString* codeAsString);
NSArray* code(NSString* codeAsString) {
    return [codeAsString $chars];
}
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
    
    Describe(@"number correct and number in wrong spot", ^{
        
        It(@"has none right", ^{
            NSNumber* numberCorrect = [MMGuessResult numberCorrectForCode: code(@"1111")
                                                                 andGuess: code(@"2222")];
            [ExpectObj(numberCorrect) toBeEqualTo: [NSNumber numberWithInt: 0]];
        });
        
        It(@"has 4 right", ^{
            NSNumber* numberCorrect = [MMGuessResult numberCorrectForCode: code(@"1111")
                                                                 andGuess: code(@"1111")];
            [ExpectObj(numberCorrect) toBeEqualTo: [NSNumber numberWithInt: 4]];
        });
        
        It(@"has 2 right", ^{
            NSNumber* numberCorrect = [MMGuessResult numberCorrectForCode: code(@"2233")
                                                                 andGuess: code(@"2222")];
            [ExpectObj(numberCorrect) toBeEqualTo: [NSNumber numberWithInt: 2]];
        });
        
        It(@"has 0 in the wrong spot when none are correct", ^{
            NSNumber* numberInWrongSpot = [MMGuessResult numberInWrongSpotForCode: code(@"1111")
                                                                         andGuess: code(@"2222")];
            [ExpectObj(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 0]];
        });
        
        It(@"has 1 in the wrong spot", ^{
            NSNumber* numberInWrongSpot = [MMGuessResult numberInWrongSpotForCode: code(@"1234")
                                                                         andGuess: code(@"2555")];
            [ExpectObj(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 1]];
        });
        
        It(@"doesn't count correct guesses as in the wrong spot", ^{
            NSNumber* numberInWrongSpot = [MMGuessResult numberInWrongSpotForCode: code(@"1234")
                                                                         andGuess: code(@"1555")];
            [ExpectObj(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 0]];
        });
        
        It(@"handles repeated characters when checking for the guesses in the wrong spot", ^{
            NSNumber* numberInWrongSpot = [MMGuessResult numberInWrongSpotForCode: code(@"1122")
                                                                         andGuess: code(@"1212")];
            [ExpectObj(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 2]];
        });
        
        It(@"has four in the wrong spot", ^{
            NSNumber* numberInWrongSpot = [MMGuessResult numberInWrongSpotForCode: code(@"1122")
                                                                         andGuess: code(@"2211")];
            [ExpectObj(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 4]];
        });
        
        It(@"has 3 in the right spot", ^{
            NSNumber* numberInWrongSpot = [MMGuessResult numberInWrongSpotForCode: code(@"1123")
                                                                         andGuess: code(@"3311")];
            [ExpectObj(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 3]];
        });
        
    });
    
}
