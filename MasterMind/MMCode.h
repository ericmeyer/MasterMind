#import <Foundation/Foundation.h>

@interface MMCode : NSObject

-(NSNumber*) numberCorrectForCode: (NSString*) code andGuess: (NSString*) guess;
-(NSNumber*) numberInWrongSpotForCode: (NSString*) code andGuess: (NSString*) guess;

@end
