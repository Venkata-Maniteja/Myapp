//
//  ChooseRecipes.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-04-13.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "ChooseRecipes.h"
#import "buttonLabel.h"
#import "HomeView.h"


@interface ChooseRecipes ()
@property (strong,nonatomic) UIView *butLab;

@property (strong,nonatomic) NSMutableArray *buttonLabelsArray;
@property (strong,nonatomic) NSMutableArray *factsArray;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;

@end

@implementation ChooseRecipes
@synthesize butLab,buttonLabelsArray,tipsLabel,factsArray;

@synthesize recivedIng;

- (void)viewDidLoad {
    [super viewDidLoad];
     buttonLabelsArray=[[NSMutableArray alloc]init];
    butLab = [[buttonLabel alloc] initWithFrame:CGRectMake(120, 180, 82, 36)];
    butLab.backgroundColor = [UIColor whiteColor];
    [buttonLabelsArray addObject:butLab];
    
    
    [self.view addSubview:butLab];
    
    UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 75, 25)];
    yourLabel.text=recivedIng.mainIngredient;
    yourLabel.adjustsFontSizeToFitWidth=YES;
    //  [yourLabel setCenter:butLab.center];
    [yourLabel setTextColor:[UIColor blackColor]];
    [yourLabel setBackgroundColor:[UIColor clearColor]];
    [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 10.0f]];
    butLab.backgroundColor=[UIColor clearColor];
    [butLab addSubview:yourLabel];
    

    NSLog(@"reciebved ing name is %@",recivedIng.mainIngredient);
    [[NSUserDefaults standardUserDefaults] setObject:recivedIng.mainIngredient forKey:@"selectedRecipie"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    factsArray=[[NSMutableArray alloc]init];
    if ([recivedIng.mainIngredient isEqualToString:@"Egg"]) {
        
        
        
        [factsArray addObject:@"Eggs are a protein-packed, nutrient-rich, and affordable breakfast food"];
        [factsArray addObject:@"An egg’s shell color doesn’t indicate the quality or nutritional value of an egg"];
        [factsArray addObject:@"The color of an egg yolk is determined by a hen’s diet"];
        [factsArray addObject:@"An egg contains 2/3 of your recommended cholesterol intake"];
        [factsArray addObject:@"Studies show that regular egg consumption does not increase risk of heart disease"];
        [factsArray addObject:@"Eggs contain a high dose of protein"];
        [factsArray addObject:@"Separate eggs from other foods in your grocery cart, grocery bags and in the refrigerator to prevent cross-contamination"];
        [factsArray addObject:@"Egg yolks are one of the few foods that are a naturally good source of Vitamin D"];
        [factsArray addObject:@"To tell if an egg is raw or hard-cooked, spin it! If the egg spins easily, it is hard-cooked but if it wobbles, it is raw"];
        [factsArray addObject:@"Eggs contain the highest quality protein you can buy"];
        
    }

    NSTimer* myTimer ;
    
    myTimer= [NSTimer scheduledTimerWithTimeInterval: 4.0 target: self
                                            selector: @selector(changeTipsNJokes:) userInfo: nil repeats: YES];
    
    // Do any additional setup after loading the view.
}

-(void)changeTipsNJokes:(NSTimer*) t {
    
    CATransition *animation = [CATransition animation];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionFade;
    animation.duration = 0.75;
    [tipsLabel.layer addAnimation:animation forKey:@"kCATransitionFade"];
    
    tipsLabel.numberOfLines=2;
    tipsLabel.textColor=[UIColor whiteColor];
    
    tipsLabel.text=[factsArray objectAtIndex:arc4random_uniform((uint32_t)factsArray.count)];
    tipsLabel.adjustsFontSizeToFitWidth=YES;
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // CGPoint locationPoint = [[touches anyObject] locationInView:butLab];
    // NSLog(@"%f %f",locationPoint.x,locationPoint.y);
    for (UIView *but in buttonLabelsArray) {
        CGPoint locationPoint = [[touches anyObject] locationInView:but];
        if (CGRectContainsPoint(but.bounds, [touches.anyObject  locationInView:but])==YES){
            if ( (locationPoint.x>=64 && locationPoint.x<=80)
                &&  (locationPoint.y>=3  && locationPoint.y<=12) ) {
                
                NSLog(@"pressed close button");
                [but removeFromSuperview]; //here when i clicked on top right,only the last view that is added is getting removed
                HomeView *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeView"];
                
                [self presentViewController:vc animated:YES completion:nil];
            }
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
