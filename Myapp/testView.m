//
//  testView.m
//  Myapp
//
//  Created by Venkata Maniteja on 2015-02-21.
//  Copyright (c) 2015 Venkata Maniteja. All rights reserved.
//

#import "testView.h"
#import "buttonLabel.h"

@interface testView ()

@property (strong,nonatomic) UIView *butLab;

@property (strong,nonatomic) NSMutableArray *buttonLabelsArray;
@property (weak, nonatomic) IBOutlet UITextField *tfield;
@property (weak, nonatomic) IBOutlet UILabel *mylab;
@property (weak, nonatomic) IBOutlet UIView *fadeOutView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation testView

@synthesize butLab,buttonLabelsArray,tfield,mylab;
@synthesize fadeOutView,button;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    buttonLabelsArray=[[NSMutableArray alloc]init];
   
    // Do any additional setup after loading the view.
}


- (IBAction)addView:(id)sender {
    
    
    [UIView  animateWithDuration:0.5 animations:^{
        fadeOutView.alpha = 0;
    } completion: ^(BOOL finished) {//creates a variable (BOOL) called "finished" that is set to *YES* when animation IS completed.
        fadeOutView.hidden = finished;//if animation is finished ("finished" == *YES*), then hidden = "finished" ... (aka hidden = *YES*)
    }];
    
    NSString *min = @"0"; //Get the current text from your minimum and maximum textfields.
    NSString *max = @"510";
    
    
    int randNum = rand() % ([max intValue] - [min intValue]) + [min intValue];
    butLab = [[buttonLabel alloc] initWithFrame:CGRectMake(randNum, randNum, 82, 36)];
    butLab.backgroundColor = [UIColor whiteColor];
    [buttonLabelsArray addObject:butLab];
    
    
    [self.view addSubview:butLab];

    UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 30, 20)];
    yourLabel.text=@"salt";
  //  [yourLabel setCenter:butLab.center];
    [yourLabel setTextColor:[UIColor blackColor]];
    [yourLabel setBackgroundColor:[UIColor clearColor]];
    [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 10.0f]];
    butLab.backgroundColor=[UIColor clearColor];
    [butLab addSubview:yourLabel];

    
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
