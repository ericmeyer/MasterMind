#import <Foundation/Foundation.h>

@protocol MMGuessResult <NSObject>

@property(nonatomic, strong) NSNumber* numberCorrect;
@property(nonatomic, strong) NSNumber* numberInWrongSpot;
@property(nonatomic, strong) NSArray* guess;

@end
