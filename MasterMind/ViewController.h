#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UILabel* numberCorrect;
    IBOutlet UILabel* numberInWrongSpot;
}
@property (nonatomic, retain) UILabel* numberCorrect;
@property (nonatomic, retain) UILabel* numberInWrongSpot;

@end
