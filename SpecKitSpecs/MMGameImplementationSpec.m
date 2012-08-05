#import <SpecKit/SpecKit.h>
#import "MMGameImplementation.h"
#import "ConciseKit.h"

SpecKitContext(MMGameImplementationSpec) {

    __block MMGameImplementation* game;
    
    BeforeEach(^{
        game = [MMGameImplementation new];
    });

    Describe(@"initial game state", ^{
        
        It(@"is not over", ^{
            [ExpectBool([game isOver]) toBeFalse];
        });
        
        It(@"has 20 remaining guesses", ^{
            [ExpectInt([game.numberOfRemainingGuesses intValue]) toBe: 20];
        });
                
        It(@"has no winner", ^{
            [ExpectBool([game didWin]) toBeFalse];
        });
        
    });

    Describe(@"taking a guess", ^{

        It(@"uses a remaining guess", ^{
            game.secretCode = [@"1234" $chars];
            [game takeGuess: [@"5678" $chars]];

            [ExpectObj(game.numberOfRemainingGuesses) toBeEqualTo: [NSNumber numberWithInt: 19]];
        });

    });
}
