#import "OCDSpec/OCDSpec.h"
#import "MMGame.h"

CONTEXT(MMGameSpec)
{
    __block MMGame* game;
    
    describe(@"initial game state",
             beforeEach(
                ^{
                    game = [MMGame new];
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
    
}