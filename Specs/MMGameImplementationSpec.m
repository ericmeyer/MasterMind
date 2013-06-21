#import <OCDSpec2/OCDSpec2.h>
#import "MMGameImplementation.h"
#import "MMGuessResultImplementation.h"
#import "ConciseKit.h"

OCDSpec2Context(MMGameImplementationSpec) {

    __block MMGameImplementation* game;
    
    BeforeEach(^{
        game = [MMGameImplementation new];
    });

    Describe(@"gameWithCode", ^{
        
        It(@"sets the code on the game", ^{
            game = [MMGameImplementation gameWithCode: [@"1234" $chars]];
            [ExpectObj([game.secretCode $join]) toBeEqualTo: @"1234"];
        });
        
    });
    
    Describe(@"initial game state", ^{
        
        It(@"is not over", ^{
            [ExpectBool([game isOver]) toBeFalse];
        });
        
        It(@"has 20 remaining guesses", ^{
            [ExpectInt([game.numberOfRemainingGuesses intValue]) toBe: 12];
        });
                
        It(@"has no winner", ^{
            [ExpectBool([game didWin]) toBeFalse];
        });
        
    });

    Describe(@"taking a guess", ^{
        
        It(@"uses a remaining guess", ^{
            game.secretCode = [@"1234" $chars];
            [game takeGuess: [@"5678" $chars]];

            [ExpectObj(game.numberOfRemainingGuesses) toBeEqualTo: [NSNumber numberWithInt: 11]];
        });
        
        It(@"is over on a correct guess", ^{
            game.secretCode = [@"1234" $chars];
            [game takeGuess: [@"1234" $chars]];
            
            [ExpectBool([game isOver]) toBeTrue];
        });

        It(@"is a winning game on a correct guess", ^{
            game.secretCode = [@"1234" $chars];
            [game takeGuess: [@"1234" $chars]];
            
            [ExpectBool([game didWin]) toBeTrue];
        });

    });
    
    Describe(@"isOver", ^{
        
        It(@"is over when there are no more remaining guesses", ^{
            game = [MMGameImplementation gameWithCode: [@"1234" $chars]];
            game.numberOfRemainingGuesses = [NSNumber numberWithInt: 0];
            
            [ExpectBool(game.isOver) toBeTrue];
        });
        
    });
    
    Describe(@"recorded guesses", ^{
        
        __block MMGuessResultImplementation* guessResult;
        
        BeforeEach(^{
            game = [MMGameImplementation gameWithCode: [@"1234" $chars]];
        });

        It(@"starts with no guesses", ^{
            [ExpectInt([[game guessResults] count]) toBe: 0];
        });
        
        It(@"keeps track of one guess", ^{
            [game takeGuess: [@"1133" $chars]];
            
            [ExpectInt([[game guessResults] count]) toBe: 1];
            guessResult = [[game guessResults] lastObject];
            [ExpectObj([[guessResult guess] $join]) toBeEqualTo: @"1133"];
            [ExpectInt([[guessResult numberCorrect] intValue]) toBe: 2];
            [ExpectInt([[guessResult numberInWrongSpot] intValue]) toBe: 0];
        });

        It(@"keeps track of two guesses", ^{
            [game takeGuess: [@"1133" $chars]];
            [game takeGuess: [@"3344" $chars]];
            
            [ExpectInt([[game guessResults] count]) toBe: 2];
            guessResult = [[game guessResults] lastObject];
            [ExpectObj([[guessResult guess] $join]) toBeEqualTo: @"3344"];
            [ExpectInt([[guessResult numberCorrect] intValue]) toBe: 1];
            [ExpectInt([[guessResult numberInWrongSpot] intValue]) toBe: 1];
        });

    });
}
