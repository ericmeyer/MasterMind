#import "MMCode.h"

@interface MMCode(private)
-(NSArray*) stringToArray: (NSString*) string;
@end

@implementation MMCode

-(NSNumber*) numberCorrectForCode: (NSString*) code andGuess: (NSString*) guess {
    int numberCorrect = 0;
    for (int i=0; i < [code length]; i++) {
        if ([code characterAtIndex: i] == [guess characterAtIndex: i]) {
            numberCorrect++;
        }
    }
    return [NSNumber numberWithInt: numberCorrect];
}

-(NSNumber*) numberInWrongSpotForCode: (NSString*) code andGuess: (NSString*) guess {
    int numberInWrongSpot = 0;
    NSArray* codeAsArray = [self stringToArray: code];
    NSArray* guessAsArray = [self stringToArray: guess];
    NSMutableArray* incorrectCodeParts = [NSMutableArray array];
    NSMutableArray* incorrectGuessParts = [NSMutableArray array];
    for (int i=0; i < [guessAsArray count]; i++) {
        if ([code characterAtIndex: i] != [guess characterAtIndex: i]) {
            [incorrectCodeParts addObject: [codeAsArray objectAtIndex: i]];
            [incorrectGuessParts addObject: [guessAsArray objectAtIndex: i]];
        }
    }
    for (NSString* guessAtSpot in incorrectGuessParts) {
        if ([incorrectCodeParts containsObject: guessAtSpot]) {
            numberInWrongSpot++;
            [incorrectCodeParts removeObject: guessAtSpot];
        }
    }
    return [NSNumber numberWithInt: numberInWrongSpot];
}

-(NSArray*) stringToArray: (NSString*) string {
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    for (int i=0; i < [string length]; i++) {
        NSString *spot  = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
        [array addObject: spot];
    }
    return array;
}

@end
