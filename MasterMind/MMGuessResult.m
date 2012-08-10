#import "MMGuessResult.h"

@implementation MMGuessResult

@synthesize numberCorrect, numberInWrongSpot, guess;

+(id) resultFromCode:(NSArray*) code andGuess:(NSArray*) guess {
    MMGuessResult* result = [MMGuessResult new];
    result.numberCorrect = [MMGuessResult numberCorrectForCode: code andGuess: guess];
    result.numberInWrongSpot = [MMGuessResult numberInWrongSpotForCode: code andGuess: guess];
    result.guess = guess;
    return result;
}

+(NSNumber*) numberCorrectForCode: (NSArray*) code andGuess: (NSArray*) guess {
    int numberCorrect = 0;
    for (int i=0; i < [code count]; i++) {
        if ([[code objectAtIndex: i] isEqualToString: [guess objectAtIndex: i] ]) {
            numberCorrect++;
        }
    }
    return [NSNumber numberWithInt: numberCorrect];
}

+(NSNumber*) numberInWrongSpotForCode: (NSArray*) code andGuess: (NSArray*) guess {
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

+(NSDictionary*) pegFrequency:(NSArray*) pegs {
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
