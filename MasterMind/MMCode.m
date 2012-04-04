#import "MMCode.h"

@interface MMCode(private)
-(NSMutableArray*) stringToArray: (NSString*) string;
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
    int numberCorrectUnordered = 0;
    int numberCorrectOrdered = [[self numberCorrectForCode: code andGuess: guess] intValue];
    NSMutableArray* codeAsArray = [self stringToArray: code];
    NSMutableArray* guessAsArray = [self stringToArray: guess];
    NSMutableDictionary* codePegFrequency = [NSMutableDictionary dictionary];
    NSMutableDictionary* guessPegFrequency = [NSMutableDictionary dictionary];

    for (NSString* peg in codeAsArray) {

        NSNumber* pegCount = [codePegFrequency objectForKey: peg];
        if (pegCount) {
            [codePegFrequency setValue: [NSNumber numberWithInt: [pegCount intValue] + 1] forKeyPath:peg];
        } else {
            [codePegFrequency setValue: [NSNumber numberWithInt: 1] forKeyPath: peg];
        }
    }

    for (NSString* peg in guessAsArray) {
        NSNumber* newCount;
        NSNumber* pegCount = [guessPegFrequency objectForKey: peg];
        if (pegCount) {
            newCount = [NSNumber numberWithInt: [pegCount intValue] + 1];
        } else {
            newCount = [NSNumber numberWithInt: 1];
        }
        [guessPegFrequency setValue: newCount forKey: peg];
    }

    for(NSString* peg in guessPegFrequency) {
        int guessCount = [[guessPegFrequency objectForKey: peg] intValue];
        int codeCount = [[codePegFrequency objectForKey: peg] intValue];
        if (guessCount < codeCount) {
            numberCorrectUnordered += guessCount;
        } else {
            numberCorrectUnordered += codeCount;
        }
    }

    return [NSNumber numberWithInt: (numberCorrectUnordered - numberCorrectOrdered)];
}

-(NSMutableArray*) stringToArray: (NSString*) string {
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    for (int i=0; i < [string length]; i++) {
        NSString *spot  = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
        [array addObject: spot];
    }
    return array;
}

@end
