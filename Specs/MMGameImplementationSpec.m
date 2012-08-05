#import "OCDSpec/OCDSpec.h"
#import "MMGameImplementation.h"
#import "ConciseKit.h"

CONTEXT(MMGameImplementation)
{
    __block MMGameImplementation* game;
    
    describe(@"initial game state",
             beforeEach(
                ^{
                    game = [MMGameImplementation new];
                }),
             it(@"is not over",
                ^{
                    expectFalse([game isOver]);
                }),
             it(@"has 20 remaining guesses",
                ^{
                    [expect(game.numberOfRemainingGuesses) toBeEqualTo: [NSNumber numberWithInt: 20]];
                }),
             it(@"has no winnder",
                ^{
                    expectFalse([game didWin]);
                }),
             nil);
    
    describe(@"taking a guess",
             beforeEach(
                ^{
                    game = [MMGameImplementation new];
                }),
             it(@"uses a remaining guess",
                ^{
                    game.secretCode = [@"1234" $chars];
                    [game takeGuess: [@"5678" $chars]];
                    
                    [expect(game.numberOfRemainingGuesses) toBeEqualTo: [NSNumber numberWithInt: 19]];
                }),
             nil);
}