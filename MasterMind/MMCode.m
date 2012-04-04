#import "MMCode.h"

@interface MMCode(private)
-(NSDictionary*) pegFrequency:(NSString*) pegs;
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

    NSDictionary* codePegFrequency = [self pegFrequency: code];
    NSDictionary* guessPegFrequency = [self pegFrequency: guess];

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

-(NSDictionary*) pegFrequency:(NSString*) pegs {
    NSMutableDictionary* frequencys = [NSMutableDictionary dictionary];
    NSMutableArray* pegsAsArray = [self stringToArray: pegs];
    for (NSString* peg in pegsAsArray) {
        NSNumber* pegCount = [frequencys objectForKey: peg];
        if (pegCount) {
            [frequencys setValue: [NSNumber numberWithInt: [pegCount intValue] + 1] forKeyPath:peg];
        } else {
            [frequencys setValue: [NSNumber numberWithInt: 1] forKeyPath: peg];
        }
    }
    return frequencys;
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
