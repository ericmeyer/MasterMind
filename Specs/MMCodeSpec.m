#import "OCDSpec/OCDSpec.h"
#import "MMCode.h"

CONTEXT(MMCodeSpec)
{
    __block MMCode* mmCode;
    
    describe(@"mastermind number correct",
             beforeEach(^{
                    mmCode = [[[MMCode alloc] init] autorelease];
                }),
             it(@"has none right",
                ^{
                    NSNumber* numberCorrect = [mmCode numberCorrectForCode: @"1111" andGuess: @"2222"];
                    [expect(numberCorrect) toBeEqualTo: [NSNumber numberWithInt: 0]];
                }),
             it(@"has 4 right",
                ^{
                    NSNumber* numberCorrect = [mmCode numberCorrectForCode: @"1111" andGuess: @"1111"];
                    [expect(numberCorrect) toBeEqualTo: [NSNumber numberWithInt: 4]];
                }),
             it(@"has 2 right",
                ^{
                    NSNumber* numberCorrect = [mmCode numberCorrectForCode: @"2233" andGuess: @"2222"];
                    [expect(numberCorrect) toBeEqualTo: [NSNumber numberWithInt: 2]];
                }),
             it(@"has 0 in the wrong spot when none are correct",
                ^{
                    NSNumber* numberInWrongSpot = [mmCode numberInWrongSpotForCode: @"1111" andGuess: @"2222"];
                    [expect(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 0]];
                }),
             it(@"has 1 in the wrong spot",
                ^{
                    NSNumber* numberInWrongSpot = [mmCode numberInWrongSpotForCode: @"1234" andGuess: @"2555"];
                    [expect(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 1]];
                }),
             it(@"doesn't count correct guesses as in the wrong spot",
                ^{
                    NSNumber* numberInWrongSpot = [mmCode numberInWrongSpotForCode: @"1234" andGuess: @"1555"];
                    [expect(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 0]];
                }),
             it(@"handles repeated characters when checking for the guesses in the wrong spot",
                ^{
                    NSNumber* numberInWrongSpot = [mmCode numberInWrongSpotForCode: @"1122" andGuess: @"1212"];
                    [expect(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 2]];
                }),
             it(@"has four in the wrong spot",
                ^{
                    
                    NSNumber* numberInWrongSpot = [mmCode numberInWrongSpotForCode: @"1122" andGuess: @"2211"];
                    [expect(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 4]];
                }),
             it(@"has 3 in the right spot",
                ^{
                    NSNumber* numberInWrongSpot = [mmCode numberInWrongSpotForCode: @"1123" andGuess: @"3311"];
                    [expect(numberInWrongSpot) toBeEqualTo: [NSNumber numberWithInt: 3]];
                }),
             nil);
}
