#import <Foundation/Foundation.h>

@interface MMCode : NSObject

-(NSNumber*) numberCorrectForCode: (NSArray*) code andGuess: (NSArray*) guess;
-(NSNumber*) numberInWrongSpotForCode: (NSArray*) code andGuess: (NSArray*) guess;

@end
