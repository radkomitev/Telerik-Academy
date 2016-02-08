#import "ListViewController.h"
#import <Parse/Parse.h>

@implementation MyCellView
@end

@interface ListViewController ()

@property (nonatomic, strong) NSMutableArray* titles;
@property (nonatomic, strong) NSMutableArray* descriptions;
@property (nonatomic, strong) NSMutableArray* priorities;
@property (nonatomic, strong) NSMutableArray* images;
@property (nonatomic, strong) NSMutableArray* categoriesProblems;

@end

@implementation ListViewController


-(void) viewDidLoad{
    [super viewDidLoad];
    self.title = @"List problems";
    
    self.titles = [[NSMutableArray alloc] init];
    self.descriptions = [[NSMutableArray alloc] init];
    self.priorities = [[NSMutableArray alloc] init];
    self.images = [[NSMutableArray alloc] init];
    self.categoriesProblems = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"CareAndShare_Problem"];
    [query orderByDescending:@"Priority"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            for(id pr in objects)
            {
                NSString* title = [pr objectForKey:@"Title"];
                NSString* categoryProblem = [pr objectForKey:@"Category"];
                NSString* description = [pr objectForKey:@"Description"];
                NSString* priority = [pr objectForKey:@"Priority"];
                PFFile *image = [pr objectForKey:@"Image"];
                
                [self.titles addObject:title];
                [self.priorities addObject:priority];
                [self.descriptions addObject:description];
                [self.images addObject:image];
                [self.categoriesProblems addObject:categoryProblem];
            }
            [self.listView reloadData];
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

static NSString* cellIndentifier = @"MyCell";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCellView *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    cell.title.text = [self.titles objectAtIndex:indexPath.row];
    cell.idea.text = [self.descriptions objectAtIndex:indexPath.row];
    cell.priorityProblem.text = [self.priorities objectAtIndex:indexPath.row];
    cell.categoryProblem.text = [self.categoriesProblems objectAtIndex:indexPath.row];
    PFFile *file = [self.images objectAtIndex:indexPath.row];
    
    [file getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            cell.image.image = [UIImage imageWithData:data];
        }
    }];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.titles.count;
}

@end
