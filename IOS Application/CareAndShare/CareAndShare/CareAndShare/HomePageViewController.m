
#import "HomePageViewController.h"

@implementation HomePageViewController
-(void) viewDidLoad{
    [self.labelAboutApp setHidden:YES];
}

- (IBAction)buttonAboutApp:(id)sender {
    if(self.labelAboutApp.hidden == YES)
    {
        [self.labelAboutApp setHidden:NO];
    }
    else
    {
        [self.labelAboutApp setHidden:YES];
    }
    
}
@end
