#import "CoverPageViewController.h"

@interface CoverPageViewController(){
    NSMutableArray *dataTitles;
}

@end

@implementation CoverPageViewController

@synthesize pieChart;

-(void)viewDidLoad{

    [super viewDidLoad];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    NSNumber *allProblems = [NSNumber numberWithInt:25];
    NSNumber *solvedProblems = [NSNumber numberWithInt:5];
    
    dataTitles = [[NSMutableArray alloc] initWithObjects:@"All problems", @"Solved problems", nil];
    
    [dataArray addObject:allProblems];
    [dataArray addObject:solvedProblems];
    
    [self.pieChart renderInLayer:self.pieChart dataArray:dataArray];
    
 //   [self.pieChart customamizeDraw:self.pieChart pieCentre:(CGPointMake(200, 200)) animationSpeed:0.5 labelRadius:(500)];
    
 //   [self.pieChart drawLegends:self.pieChart dataArray:dataTitles];
 //    self.pieChart.pieRadius = 150;
 //   self.pieChart.pieCenter = CGPointMake(200, 200);
//  [self.pieChart sizeToFit];

}
@end
