#import "DetailsViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface DetailsViewController()
{
    NSArray *categories;
    PFObject *myParseObject;
    NSString *pr;
    NSString *category;
}

@end

@implementation DetailsViewController


-(void)viewDidLoad
{
    categories = [NSArray arrayWithObjects:@"Infrastructure", @"Nature", @"Health", @"Animals", @"Sport", @"Other",nil];
    //[self.dataPicker setValue:[UIColor brownColor] forKey:@"textColor"];
    [self.dataPicker selectRow:2 inComponent:0 animated:YES];
    [self.labelPriorityLow setHidden:YES];
    [self.labelPriorityHigh setHidden:YES];
    self.title = @"Details";
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return categories.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [categories objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.labelChoosenCategory.text = [categories objectAtIndex:row];
    category = [categories objectAtIndex:row];
    [self.textFieldTitle resignFirstResponder];
    [self.textFieldIdea resignFirstResponder];
}

- (IBAction)sliderPriority:(UISlider *)sender {
    
    int priority = (int) sender.value;
    
    self.labelPriorityValue.text = [@(priority) stringValue];
    pr =[@(priority) stringValue];
    
    if(priority <3)
    {
        [self.labelPriorityLow setHidden:NO];
        [self.labelPriorityMedium setHidden:YES];
        [self.labelPriorityHigh setHidden:YES];
    }
    else if(priority >= 3 && priority <= 7)
    {
        [self.labelPriorityLow setHidden:YES];
        [self.labelPriorityMedium setHidden:NO];
        [self.labelPriorityHigh setHidden:YES];
    }
    else {
        [self.labelPriorityLow setHidden:YES];
        [self.labelPriorityMedium setHidden:YES];
        [self.labelPriorityHigh setHidden:NO];
    }
    
}

- (IBAction)buttonSubmitProblem:(id)sender {
    NSString *title = self.textFieldTitle.text;
    NSString *idea = self.textFieldTitle.text;
    if([title isEqualToString:@""]  || [idea isEqualToString:@""])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Incorect input"
                                                                       message:@"Title and your idea are mandatory for us!"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    else
    {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        myParseObject = [delegate myParseObject];
        myParseObject[@"Title"] = self.textFieldTitle.text;
        myParseObject[@"Description"] = self.textFieldIdea.text;
        myParseObject[@"Priority"] = pr;
        myParseObject[@"Category"] = category;
        [myParseObject saveInBackground];
        [self.navigationController popToRootViewControllerAnimated:YES];
      
    }
    
}
@end
