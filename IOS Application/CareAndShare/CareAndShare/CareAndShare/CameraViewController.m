#import "CameraViewController.h"
#import "AppDelegate.h"

@interface CameraViewController()
{
    PFObject *myParseObject;
}
@end

@implementation CameraViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Camera";
    [self.buttonGoToDetailsPage setHidden:YES];
    
}

- (IBAction)buttonTakePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    [self.buttonGoToDetailsPage setHidden:NO];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    myParseObject = [delegate myParseObject];
    
    NSData *imageData = UIImagePNGRepresentation(chosenImage);
    NSString *imageName = [self genRandString];
    NSString *fullName = [imageName stringByAppendingString:@".png"];
    PFFile *imageFile = [PFFile fileWithName:fullName data:imageData];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            if (succeeded) {
                myParseObject[@"Image"] = imageFile;
            }
        } else {
            // Handle error
        }        
    }];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (NSString *)genRandString{
    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: 20];
    for (int i=0; i<20; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

@end
