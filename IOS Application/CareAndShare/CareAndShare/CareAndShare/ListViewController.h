#import <UIKit/UIKit.h>

@interface MyCellView : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *idea;
@property (weak, nonatomic) IBOutlet UILabel *priorityProblem;

@property (weak, nonatomic) IBOutlet UILabel *categoryProblem;
@end

@interface ListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listView;

@end
