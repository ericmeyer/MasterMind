#import "MMCode.h"
#import "ConciseKit.h"

@interface MMCode(private)
-(NSDictionary*) pegFrequency:(NSArray*) pegs;
@end

@implementation MMCode

-(NSNumber*) numberCorrectForCode: (NSArray*) code andGuess: (NSArray*) guess {
    int numberCorrect = 0;
    for (int i=0; i < [code count]; i++) {
        if ([[code objectAtIndex: i] isEqualToString: [guess objectAtIndex: i] ]) {
            numberCorrect++;
        }
    }
    return [NSNumber numberWithInt: numberCorrect];
}

-(NSNumber*) numberInWrongSpotForCode: (NSArray*) code andGuess: (NSArray*) guess {
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

-(NSDictionary*) pegFrequency:(NSArray*) pegs {
    NSMutableDictionary* frequencys = [NSMutableDictionary dictionary];
    for (NSString* peg in pegs) {
        NSNumber* pegCount = [frequencys objectForKey: peg];
        if (pegCount) {
            [frequencys setValue: [NSNumber numberWithInt: [pegCount intValue] + 1] forKeyPath:peg];
        } else {
            [frequencys setValue: [NSNumber numberWithInt: 1] forKeyPath: peg];
        }
    }
    return frequencys;
}

@end
