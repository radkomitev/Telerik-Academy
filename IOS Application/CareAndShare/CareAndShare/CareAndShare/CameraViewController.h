#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)buttonTakePhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonGoToDetailsPage;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property NSString *longitudeToPass;
@property NSString *latitudeToPass;

@end
