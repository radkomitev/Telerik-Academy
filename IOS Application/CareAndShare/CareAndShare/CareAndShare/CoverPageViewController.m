#import "CoverPageViewController.h"
#import <Parse/Parse.h>

@interface CoverPageViewController(){
    NSMutableArray *dataTitles;
    NSNumber* allProblems;
    NSNumber* solvedProblems;
}

@end

@implementation CoverPageViewController

@synthesize pieChart;

-(void)viewDidLoad{

    [super viewDidLoad];
    self.title = @"Statistic";
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"CareAndShare_Problem"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            allProblems = [NSNumber numberWithInt:(int)objects.count];
            solvedProblems = [NSNumber numberWithInt:2];
            dataTitles = [[NSMutableArray alloc] initWithObjects:@"All problems", @"Solved problems", nil];
            
            [dataArray addObject:allProblems];
            [dataArray addObject:solvedProblems];
    
        } else {
        }
        
        [self.pieChart renderInLayer:self.pieChart dataArray:dataArray];
    }];
}
@end
