#import <Foundation/Foundation.h>

@interface MMGuessResult : NSObject {
    NSNumber* numberCorrect;
    NSNumber* numberInWrongSpot;
}
@property(nonatomic, strong) NSNumber* numberCorrect;
@property(nonatomic, strong) NSNumber* numberInWrongSpot;

+(id) resultFromCode:(NSArray*) code andGuess:(NSArray*) guess;

@end
