//
//  ChooseRecipieTable.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-04-19.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "ChooseRecipieTable.h"
#import "MainIngredientsCell.h"
#import "MainCellBackground.h"

@interface ChooseRecipieTable ()

@property (strong,nonatomic) NSMutableArray *recipieArray;

@end

@implementation ChooseRecipieTable
@synthesize recipieArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor=[UIColor clearColor];
    
    NSString *recipeSelected = [[NSUserDefaults standardUserDefaults]
                                stringForKey:@"selectedRecipie"];
    
    recipieArray=[[NSMutableArray alloc]init];
    
    
    NSLog(@"recipei is %@",recipeSelected);
    if ([recipeSelected isEqualToString:@"Egg"]) {
        
        [recipieArray addObject:@"Basic Omlette"];
        [recipieArray addObject:@"Half Boiled"];
        [recipieArray addObject:@"Scrambled Egg"];
        [recipieArray addObject:@"Masala Omlette"];
        [recipieArray addObject:@"Veggie Omlette"];
        [recipieArray addObject:@"Simple Egg Roast"];
        
        
        
    }
   
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return recipieArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    MainIngredientsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (![cell.backgroundView isKindOfClass:[MainCellBackground class]]) {
        cell.backgroundView = [[MainCellBackground alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.backgroundColor=[UIColor clearColor];
    
    
    
    cell.textLabel.text=[recipieArray objectAtIndex:indexPath.row];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
