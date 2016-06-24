//
//  DAFeedTableViewController.m
//  Dapp-Master
//
//  Created by James Scherer on 6/7/16.
//  Copyright © 2016 James Scherer. All rights reserved.
//

#import "DAFeedTableViewController.h"
#import "DAUserProfileViewController.h"

@interface DAFeedTableViewController ()

@property (strong, nonatomic) NSMutableArray *availableUsers;

@end

@implementation DAFeedTableViewController

-(NSMutableArray *)availableUsers {
    if(!_availableUsers)
        _availableUsers = [[NSMutableArray alloc] init];
    
    return _availableUsers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.hidden = YES;
    [self updateAvailableUsers];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.availableUsers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *availableUser = [self.availableUsers objectAtIndex:indexPath.row];
    PFUser *tempUser = [availableUser objectForKey:@"member_leader"];
    
    NSLog(@"%@", tempUser.username);
    
    cell.textLabel.text = tempUser.username;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    DAUserProfileViewController *detailViewController = [[DAUserProfileViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    
    PFObject *tempObject = [self.availableUsers objectAtIndex:indexPath.row];
    
    detailViewController.groupObject = tempObject;
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}


-(void)updateAvailableUsers {
    
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"Group"];
    [query includeKey:@"member_leader"];
    [query whereKey:@"active" equalTo:[NSNumber numberWithBool:YES]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error) {
            self.availableUsers = [objects mutableCopy];
            NSLog(@"%@", objects);
            [self.tableView reloadData];
        }
        else {
            
            NSLog(@"This is the Feed error: %@", error);
        }
    }];
}


@end
