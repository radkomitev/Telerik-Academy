#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldIdea;
@property (weak, nonatomic) IBOutlet UIPickerView *dataPicker;
@property (weak, nonatomic) IBOutlet UILabel *labelChoosenCategory;
@property (weak, nonatomic) IBOutlet UILabel *labelPriorityValue;
@property (weak, nonatomic) IBOutlet UILabel *labelPriorityMedium;
@property (weak, nonatomic) IBOutlet UILabel *labelPriorityLow;

@property (weak, nonatomic) IBOutlet UILabel *labelPriorityHigh;
- (IBAction)sliderPriority:(UISlider *)sender;

- (IBAction)buttonSubmitProblem:(id)sender;

@end
