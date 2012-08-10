#import <Foundation/Foundation.h>

@interface MMGuessResult : NSObject {
    NSNumber* numberCorrect;
    NSNumber* numberInWrongSpot;
    NSArray* guess;
}
@property(nonatomic, strong) NSNumber* numberCorrect;
@property(nonatomic, strong) NSNumber* numberInWrongSpot;
@property(nonatomic, strong) NSArray* guess;

+(id) resultFromCode:(NSArray*) code andGuess:(NSArray*) guess;

+(NSNumber*) numberCorrectForCode: (NSArray*) code andGuess: (NSArray*) guess;
+(NSNumber*) numberInWrongSpotForCode: (NSArray*) code andGuess: (NSArray*) guess;

@end
