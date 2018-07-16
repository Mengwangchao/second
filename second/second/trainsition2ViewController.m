//
//  trainsition2ViewController.m
//  second
//
//  Created by Dream_Dynasty on 2018/7/12.
//  Copyright © 2018年 Dream_Dynasty. All rights reserved.
//

#import "trainsition2ViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface trainsition2ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *AnimationTableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation trainsition2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray=[[NSMutableArray alloc]init];
    [_dataArray addObject:@"position+中心坐标平移"];
    [_dataArray addObject:@"transform.scale+长宽按相同比例缩放"];
    [_dataArray addObject:@"transform.scale.x+宽比例缩放，高不变"];
    [_dataArray addObject:@"transform.scale.y+高比例缩放，宽不变"];
    [_dataArray addObject:@"transform.rotation.z+旋转某些角度"];
    [_dataArray addObject:@"opacity+透明度变化"];
    [_dataArray addObject:@"zPosition+z轴位置变化"];
    [_dataArray addObject:@"backgroundColor+背景颜色变化"];
    [_dataArray addObject:@"cornerRadius+圆角"];
    [_dataArray addObject:@"borderWidth+边框大小变化"];
    [_dataArray addObject:@"bounds+控件bounds属性变化"];
    [_dataArray addObject:@"contents+背景内容变化"];
    [_dataArray addObject:@"contentsRect.size.width+背景内容宽度变化"];
    [_dataArray addObject:@"contentsRect.size.height+背景内容高度变化"];
    [_dataArray addObject:@"hidden+控件是否显示"];
    [_dataArray addObject:@"shadowColor+阴影颜色变化"];
    [_dataArray addObject:@"shadowOffset+阴影位置变化"];
    [_dataArray addObject:@"shadowOpacity+阴影透明度变化"];
    [_dataArray addObject:@"shadowRadius+阴影圆角变化（似乎可以调节阴影模糊程度）"];
    _AnimationTableView.dataSource=self;
    _AnimationTableView.delegate=self;
    
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cells=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cells.textLabel.text=_dataArray[indexPath.row];
    return cells;
}
//动画可迭代，同时执行，形成组合动画
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIView *animationgView=[[UIView alloc]initWithFrame:CGRectMake(MAINWINDOWSWIDTH/5, MAINWINDOWSHEIGHT/5, MAINWINDOWSWIDTH*0.6, MAINWINDOWSHEIGHT*0.6)];
    animationgView.backgroundColor=[UIColor redColor];
    [self.AnimationTableView addSubview:animationgView];
    
    if(indexPath.row==0)
    {
        //中心位置平移
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        NSValue *positionValue1=[NSValue valueWithCGPoint:CGPointMake(animationgView.center.x, animationgView.center.y)];
        NSValue *positionValue2=[NSValue valueWithCGPoint:CGPointMake(animationgView.center.x+100, animationgView.center.y+100)];
        animation.values=@[positionValue1,positionValue2];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
    }
    if(indexPath.row==1)
    {
        //长宽按相同比例缩放
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
       
        animation.values=@[@1.0,@0.5];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
    }
    if(indexPath.row==2)
    {
        //width按比例缩放,height不变
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        
        animation.values=@[@1.0,@0.5];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
    }
    if (indexPath.row==3) {
        //height按比例缩放,width不变
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        
        animation.values=@[@1.0,@0.5];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
    }
    if (indexPath.row==4) {
        //z轴旋转，value为0为不旋转，0->3.14（即π）为顺时针旋转180度,3.14->0为逆时针旋转180度
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.duration=4;
        animation.keyTimes=@[@0.0,@0.5,@1.0];
        
        animation.values=@[@0.0,@3.14,@0.0];
        [animationgView.layer addAnimation:animation forKey:nil];
       [NSTimer scheduledTimerWithTimeInterval:4 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
        
    }
    if (indexPath.row==5) {
        //透明度变化，value，0->alpha=0
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        
        animation.values=@[@1.0,@0.5];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
    }
    if(indexPath.row==6)
    {
        //z轴位置变化，可以将某个视图覆盖下的控件移动到上一层
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        animation.values=@[@-1.0,@1.0];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
           
        }];
    }
    if (indexPath.row==7) {
        //背景颜色变化
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];

        animation.values=@[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor grayColor].CGColor];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if (indexPath.row==8) {
        //圆角，value 指的是圆角圆半径，越大的弧度越大
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"cornerRadius"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        
        animation.values=@[@1.0,@60];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if (indexPath.row==9) {
        //边框大小变换，value越大边框越大。
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        
        animation.values=@[@10.0,@0.5];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if (indexPath.row==10) {
        //控件bounds变化
       
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"bounds"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        NSValue *boundsValue1=[NSValue valueWithCGRect:CGRectMake(animationgView.bounds.origin.x, animationgView.bounds.origin.y, animationgView.bounds.size.width, animationgView.bounds.size.height)];
        NSValue *boundsValue2=[NSValue valueWithCGRect:CGRectMake(0, 0, MAINWINDOWSWIDTH, MAINWINDOWSHEIGHT)];
        animation.values=@[boundsValue1,boundsValue2];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if (indexPath.row==11) {
        
        //内容变化，只能是image，backgroundcolor等属性中有CGXXX（例如image就有CGimage属性）的。注：UIview不可以。
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"contents"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        
        animation.values=@[(__bridge id)[UIImage imageNamed:@"画轴"].CGImage,(__bridge id)[UIImage imageNamed:@"古画轴"].CGImage];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if(indexPath.row==12)
    {
        //背景内容宽度变化，width=width/value
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"画轴"]];
        imageView.frame=CGRectMake(50, 50, 100, 100);
        [animationgView addSubview:imageView];
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"contentsRect.size.width"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        animation.values=@[@1.0,@2.0];
        [imageView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
    }
    if(indexPath.row==13)
    {
        //背景内容宽度变化，height=height/value
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"画轴"]];
        imageView.frame=CGRectMake(50, 50, 100, 100);
        [animationgView addSubview:imageView];
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"contentsRect.size.height"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        animation.values=@[@1.0,@2.0];
        [imageView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
        }];
    }
    if (indexPath.row==14) {
        //控件是否显示
        
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"hidden"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        
       
        animation.values=@[@YES,@NO];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if (indexPath.row==15) {
        //阴影颜色变化
        animationgView.layer.shadowOffset=CGSizeMake(50, 50);
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"shadowColor"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        animationgView.layer.shadowOpacity=1;//一定要设置，默认为0
        animation.values=@[(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor grayColor].CGColor];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if (indexPath.row==16) {
        //阴影位置变化，通过size调节
        animationgView.frame=CGRectMake(100, 300, MAINWINDOWSWIDTH*0.6, MAINWINDOWSHEIGHT*0.6);
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"shadowOffset"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        animationgView.layer.shadowOpacity=1;//一定要设置，默认为0
        NSValue *OffsetValue1=[NSValue valueWithCGSize:CGSizeMake(animationgView.layer.shadowOffset.width, animationgView.layer.shadowOffset.height)];
        NSValue *OffsetValue2=[NSValue valueWithCGSize:CGSizeMake(animationgView.layer.shadowOffset.width+50, animationgView.layer.shadowOffset.height+50)];
        animation.values=@[OffsetValue1,OffsetValue2];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if(indexPath.row==17)
    {
        //阴影透明度变化
        animationgView.frame=CGRectMake(100, 300, MAINWINDOWSWIDTH*0.6, MAINWINDOWSHEIGHT*0.6);
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"shadowOpacity"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        animationgView.layer.shadowOpacity=1;//一定要设置，默认为0
        animationgView.layer.shadowOffset=CGSizeMake(50, 50);
        animationgView.layer.backgroundColor=[UIColor greenColor].CGColor;
        animation.values=@[@1.0,@0.5];
        [animationgView.layer addAnimation:animation forKey:nil];
       [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    if (indexPath.row==18) {
        //阴影圆角变化，似乎还有模糊程度的变化
        animationgView.frame=CGRectMake(100, 300, MAINWINDOWSWIDTH*0.6, MAINWINDOWSHEIGHT*0.6);
        CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"shadowRadius"];
        animation.duration=2;
        animation.keyTimes=@[@0.0,@1.0];
        animationgView.layer.shadowOpacity=1;//一定要设置，默认为0
        animationgView.layer.shadowOffset=CGSizeMake(50, 50);
        animationgView.layer.backgroundColor=[UIColor greenColor].CGColor;
        animation.values=@[@1.0,@20.0];
        [animationgView.layer addAnimation:animation forKey:nil];
        [NSTimer scheduledTimerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [animationgView removeFromSuperview];
            
        }];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

@end
