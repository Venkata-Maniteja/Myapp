//
//  MainIngredients.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-04-10.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "MainIngredients.h"
#import "MainIngredientsCell.h"
#import "MainCellBackground.h"
#import "ChooseRecipes.h"
#import "Ingredients.h"

@interface MainIngredients ()

@property (strong,nonatomic) NSMutableArray *mainIngredientsArray;
@property (strong ,nonatomic) NSMutableArray *imagePath;
@property (strong,nonatomic) NSMutableArray *objectHolder;
@property (nonatomic,strong) Ingredients *ingObj;


@end

@implementation MainIngredients

@synthesize mainIngredientsArray,imagePath,objectHolder,ingObj;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor=[UIColor clearColor];
    
    UIImage *image=[UIImage imageNamed:@"bread.jpg"];
    NSData *pngData = UIImagePNGRepresentation(image);
    NSString *filePath = [self documentsPathForFileName:@"bread.png"]; //Add the file name
    [pngData writeToFile:filePath atomically:YES]; //Write the file
    NSLog(@"file path is %@",filePath);
    mainIngredientsArray=[[NSMutableArray alloc]init];
    imagePath=[[NSMutableArray alloc]init];
    
    [mainIngredientsArray addObject:@"Egg"];
    [mainIngredientsArray addObject:@"Bread"];
    [mainIngredientsArray addObject:@"Milk"];
    [mainIngredientsArray addObject:@"Rice"];
    [mainIngredientsArray addObject:@"Black Lentil"];
    [mainIngredientsArray addObject:@"Semolina"];
    [mainIngredientsArray addObject:@" Flour"];
    [mainIngredientsArray addObject:@"Green Gram"];
    
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"egg.png"]];
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"bread.png"]];
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"milk.png"]];
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"rice.png"]];
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"lentil.png"]];
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"semolina.png"]];
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"flour.png"]];
    [imagePath addObject:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"greengram.png"]];
    
    
    objectHolder=[[NSMutableArray alloc]init];
    
    for (int i=0; i<mainIngredientsArray.count; i++) {
     
        ingObj=[Ingredients new];
        ingObj.mainIngredient=[mainIngredientsArray objectAtIndex:i];
        [objectHolder addObject:ingObj];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSString *)documentsPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSLog(@"doc path is %@",documentsPath);
    return [documentsPath stringByAppendingPathComponent:name];
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
    return mainIngredientsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainIngredientsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (![cell.backgroundView isKindOfClass:[MainCellBackground class]]) {
        cell.backgroundView = [[MainCellBackground alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.backgroundColor=[UIColor clearColor];
    
    
    cell.imageView.image=[UIImage imageWithData:[NSData dataWithContentsOfFile:[imagePath objectAtIndex:indexPath.row]]];
    cell.textLabel.text=[mainIngredientsArray objectAtIndex:indexPath.row];
    
    
    return cell;
    
    
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"sendMainIngredient"])
    {
        // Pass any objects to the view controller here, like...
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSLog(@"index path row is %d",indexPath.row);
//        ingObj=objectHolder[indexPath.row];
//        NSString *mainIngName=ingObj.mainIngredient;
        ChooseRecipes *destViewController = segue.destinationViewController;
        destViewController.recivedIng = [objectHolder objectAtIndex:indexPath.row];
        
    }
}


@end
