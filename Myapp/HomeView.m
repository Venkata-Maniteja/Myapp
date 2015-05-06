//
//  HomeView.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-03-04.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "HomeView.h"

@interface HomeView ()

@property (nonatomic,strong) NSMutableArray *tipsNjokeArray;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UIView *tipsJokesView;
@property (weak, nonatomic) IBOutlet UIButton *letsPrepareButton;
- (IBAction)openRecipieTable:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation HomeView

@synthesize tipsNjokeArray,tipsLabel,letsPrepareButton,containerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    containerView.hidden=YES;
    letsPrepareButton.hidden=NO;
    
    tipsNjokeArray=[[NSMutableArray alloc]init];
    
    [tipsNjokeArray addObject:@"Avoid eating late at night"];
    [tipsNjokeArray addObject:@"Ask yourself if you are really hungry"];
    [tipsNjokeArray addObject:@"Eat slowly"];
    [tipsNjokeArray addObject:@"Get vitamins from food-not pills"];
    [tipsNjokeArray addObject:@"Dairy products are rich in calcium"];
    [tipsNjokeArray addObject:@"Protein gives us the energy to get up and go—and keep going"];
    [tipsNjokeArray addObject:@"Divide your protein intake equally among meals."];
    [tipsNjokeArray addObject:@"Replace red meat with fish, chicken"];
    [tipsNjokeArray addObject:@"Sugar causes energy ups and downs"];
    [tipsNjokeArray addObject:@"Large amounts of added sugar can be hidden in foods such as bread"];
    [tipsNjokeArray addObject:@"Avoid sugary drinks"];
    [tipsNjokeArray addObject:@"Eat naturally sweet food such as fruit, peppers, or natural peanut butter"];
    [tipsNjokeArray addObject:@"Eating too much salt can cause high blood pressure"];
    [tipsNjokeArray addObject:@"Opt for fresh or frozen vegetables instead of canned vegetables"];
    [tipsNjokeArray addObject:@" Breakfast really is the most important meal of the day"];
    [tipsNjokeArray addObject:@"Protein digests more slowly than carbohydrates"];
    [tipsNjokeArray addObject:@"A meal with no fat can make you hungry again within an hour"];
    [tipsNjokeArray addObject:@"Eat within an hour of waking"];
    [tipsNjokeArray addObject:@"keep sodium down potassium up"];
    [tipsNjokeArray addObject:@"Successful dieters might win the Nobelly prize"];
    [tipsNjokeArray addObject:@"Some people don't like food going to waist"];
    
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
    
    tipsLabel.text=[tipsNjokeArray objectAtIndex:arc4random_uniform((uint32_t)tipsNjokeArray.count)];
    tipsLabel.adjustsFontSizeToFitWidth=YES;
    
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

- (IBAction)openRecipieTable:(id)sender {
    letsPrepareButton.layer.shouldRasterize=YES;
    letsPrepareButton.hidden=YES;
    containerView.alpha = 0;
    containerView.hidden=NO;
    [UIView animateWithDuration:0.6 animations:^{
        containerView.alpha = 1;
    }];
    
}
@end
