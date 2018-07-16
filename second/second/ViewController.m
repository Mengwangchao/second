//
//  ViewController.m
//  second
//
//  Created by Dream_Dynasty on 2017/12/10.
//  Copyright © 2017年 Dream_Dynasty. All rights reserved.
//

#import "ViewController.h"
#import "hereViewController.h"
#import "autoLayoutViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *p;
@property(nonatomic)int n;
@end
//strong weak assign copy retained
@implementation ViewController
void(^myblock)(void)=^{
    NSLog(@"myblock running");
};
-(void)dealloc{
    NSLog(@"deallc");
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    myblock();
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    myblock();
}
- (void)viewDidLoad {
    [super viewDidLoad];
/*NSString *p;*/
    
    _p=[[NSArray alloc]initWithObjects:@"qq", nil];
    NSLog(@"%@",[_p objectAtIndex:0]);
   
  
          UIView *Left =[[UIView alloc]initWithFrame:CGRectMake(0, MAINWINDOWSHEIGHT+20, MAINWINDOWSWIDTH/2, MAINWINDOWSHEIGHT/4)];
        UIView *Right=[[UIView alloc]initWithFrame:CGRectMake(MAINWINDOWSWIDTH/2, MAINWINDOWSHEIGHT+20, MAINWINDOWSWIDTH/2, MAINWINDOWSHEIGHT/4)];
        Left.backgroundColor=[UIColor redColor];
        Right.backgroundColor=[UIColor redColor];
        [self.view addSubview:Left];
        [self.view addSubview:Right];
        
        [UIView animateWithDuration:2 animations:^{
            CGRect LeftViewFrame=Left.frame;
            CGRect RightViewFrame=Right.frame;
            RightViewFrame.origin.y-=(MAINWINDOWSHEIGHT);
            LeftViewFrame.origin.y-=(MAINWINDOWSHEIGHT);
            Left.frame=LeftViewFrame;
            Right.frame=RightViewFrame;
           [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
                [UIView animateWithDuration:2 animations:^{
                    CGRect LeftViewFrame=Left.frame;
                    CGRect RightViewFrame=Right.frame;
                    LeftViewFrame.origin.x-=(MAINWINDOWSWIDTH/2);
                    RightViewFrame.origin.x+=(MAINWINDOWSWIDTH/2);
                    Left.frame=LeftViewFrame;
                    Right.frame=RightViewFrame;
                }];
                
            }];
            
            
        }];
    _n=1;
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if(_n==2)
        {
            [timer  invalidate];
           
        }
        UIView *Left1 =[[UIView alloc]initWithFrame:CGRectMake(0, MAINWINDOWSHEIGHT+30+ MAINWINDOWSHEIGHT*_n/4, MAINWINDOWSWIDTH/2, MAINWINDOWSHEIGHT/4)];
        UIView *Right1=[[UIView alloc]initWithFrame:CGRectMake(MAINWINDOWSWIDTH/2, MAINWINDOWSHEIGHT+30+ MAINWINDOWSHEIGHT*_n/4, MAINWINDOWSWIDTH/2, MAINWINDOWSHEIGHT/4)];
        Left1.backgroundColor=[UIColor redColor];
        Right1.backgroundColor=[UIColor redColor];
        [self.view addSubview:Left1];
        [self.view addSubview:Right1];
    
        [UIView animateWithDuration:2 animations:^{
            CGRect LeftViewFrame=Left1.frame;
            CGRect RightViewFrame=Right1.frame;
            RightViewFrame.origin.y-=(MAINWINDOWSHEIGHT);
            LeftViewFrame.origin.y-=(MAINWINDOWSHEIGHT);
            Left1.frame=LeftViewFrame;
            Right1.frame=RightViewFrame;
           [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
                [UIView animateWithDuration:2 animations:^{
                    CGRect LeftViewFrame=Left1.frame;
                    CGRect RightViewFrame=Right1.frame;
                    LeftViewFrame.origin.x-=(MAINWINDOWSWIDTH/2);
                    RightViewFrame.origin.x+=(MAINWINDOWSWIDTH/2);
                    Left1.frame=LeftViewFrame;
                    Right1.frame=RightViewFrame;
                }];
                
            }];
            
            
        }];
        _n++;
    }];
 
    UIButton *here=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [here setTitle:@"定位" forState:UIControlStateNormal];
    [here setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:here];
    [here addTarget:self action:@selector(hereClick:) forControlEvents:UIControlEventTouchUpInside];
   
    
    UIButton *autoLayout=[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [autoLayout setTitle:@"自适应布局" forState:UIControlStateNormal];
    [autoLayout setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:autoLayout];
    [autoLayout addTarget:self action:@selector(autoLayoutClick:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)hereClick:(UIButton *)but{
    NSLog(@"hereClick");
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    hereViewController *hereCon=[story instantiateViewControllerWithIdentifier:@"hereView"];
    [self.navigationController pushViewController:hereCon animated:YES];
}
-(void)autoLayoutClick:(UIButton *)but{
    NSLog(@"autoyoutClick");
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    autoLayoutViewController *autoCon=[story instantiateViewControllerWithIdentifier:@"autoView"];
    [self.navigationController pushViewController:autoCon animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
