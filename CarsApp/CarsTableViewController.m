//
//  CarsTableViewController.m
//  CarsApp
//
//  Created by Enrique Haro on 7/9/13.
//  Copyright (c) 2013 code3e. All rights reserved.
//

#import "CarsTableViewController.h"
#import "CarsTableCell.h"
#import "CarDetailTableViewController.h"

@interface CarsTableViewController ()

@property NSMutableArray *carMakesArray;
@property NSMutableArray *carModelsArray;
@property NSMutableArray *carPhotosArray;


@end

@implementation CarsTableViewController
@synthesize carMakesArray,carModelsArray,carPhotosArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    carMakesArray = [[NSMutableArray alloc] init];
    [carMakesArray addObjectsFromArray:@[@"Chevy",@"BMW",@"Smart",@"Toyota",@"Volvo"]];
            
    carModelsArray = [[NSMutableArray alloc] init];
    [carModelsArray addObjectsFromArray:@[@"Volt",@"Mini",@"ForTwo",@"Venza",@"s60"]];
    carPhotosArray = [[NSMutableArray alloc] init];
    [carPhotosArray addObjectsFromArray:@[@"chevy_volt.jpg",@"mini_clubman.jpg",@"smart_fortwo.jpg",@"toyota_venza.jpg",@"volvo_s60.jpg"]];
    
    self.navigationController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",carPhotosArray.count];
    UIBarButtonItem *insertObject = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(insertObject:)];
    self.navigationItem.rightBarButtonItem = insertObject;
}

-(void)insertObject:(id)sender{
    [carMakesArray insertObject:@"Chevy" atIndex:0];
    [carModelsArray insertObject:@"Volt" atIndex:0];
    [carPhotosArray insertObject:@"chevy_volt.jpg" atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    self.navigationController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",carPhotosArray.count];

    //[self.tableView reloadData];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"carDetailSegue"]) {
        CarDetailTableViewController *detailView = [segue destinationViewController];
        NSIndexPath *index = [self.tableView indexPathForCell:sender];
        detailView.infoCarArray = @[carMakesArray[index.row],carModelsArray[index.row],carPhotosArray[index.row]];
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return [carPhotosArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CarsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.carMakeLabel.text = carMakesArray[indexPath.row];
    cell.carModelLabel.text = [carModelsArray objectAtIndex:indexPath.row];
    cell.carModelLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
    cell.carMakeLabel.textColor = [UIColor blueColor];
    cell.carPhoto.image = [UIImage imageNamed:carPhotosArray[indexPath.row]];
    return cell;
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [carMakesArray removeObjectAtIndex:indexPath.row];
        [carModelsArray removeObjectAtIndex:indexPath.row];
        [carPhotosArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        self.navigationController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",carPhotosArray.count];

        //[tableView reloadData];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Index:%@",indexPath);
}

-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Index:%@",indexPath);
    self.navigationItem.rightBarButtonItem.enabled = NO;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
