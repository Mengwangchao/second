//
//  autoLayoutViewController.m
//  second
//
//  Created by Dream_Dynasty on 2018/7/10.
//  Copyright © 2018年 Dream_Dynasty. All rights reserved.
//

#import "autoLayoutViewController.h"
#import "ViewController.h"
@interface autoLayoutViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *citiesPicker;
@property(nonatomic,strong)NSArray *citiesName;
@property(nonatomic,strong)NSArray *provName;
@property(nonatomic,strong)UIView *OneView;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,strong)NSMutableArray *allName;
@property(nonatomic,strong)UILabel *lable;
@end

@implementation autoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _OneView=[[UIView alloc]init];
//    _OneView.backgroundColor=[UIColor blueColor];
//    [self.view addSubview:_OneView];
  //[self.view addConstrants  [NSLayoutConstraint constraintWithItem:<#(nonnull id)#> attribute:<#(NSLayoutAttribute)#> relatedBy:<#(NSLayoutRelation)#> toItem:<#(nullable id)#> attribute:<#(NSLayoutAttribute)#> multiplier:<#(CGFloat)#> constant:<#(CGFloat)#>]]
    //第一个参数:指定约束左边的视图view1
    
//    第二个参数:指定view1的属性attr1，具体属性见文末。
//
//    第三个参数:指定左右两边的视图的关系relation，具体关系见文末。
//
//    第四个参数:指定约束右边的视图view2
//
//    第五个参数:指定view2的属性attr2，具体属性见文末。
//
//    第六个参数:指定一个与view2属性相乘的乘数multiplier
//
//    第七个参数:指定一个与view2属性相加的浮点数constant
//https://blog.csdn.net/zhuzhihai1988/article/details/43926055
//    [NSLayoutConstraint constraintWithItem:view1
//                                 attribute:NSLayoutAttributeLeft
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:view2
//                                 attribute:NSLayoutAttributeRight
//                                multiplier:1
//                                  constant:10]     //view1的左侧，在，view2的右侧，再多10个点，的地方，基本等于 View1.frame.origin.x  = (View2.frame.origin.x +View2.frame.size.width)  * 1  + 10
    //constraintsWithVisualFormat用法 见 https://blog.csdn.net/lin1986lin/article/details/40736839
    
    for (int component = 0; component<self.allName.count; component++) {
      
                 [self pickerView:nil didSelectRow:0 inComponent:component];
             }
    _citiesPicker.dataSource=self;
    _citiesPicker.delegate=self;
    NSString *citiesPath=[[NSBundle mainBundle]pathForResource:@"cities.plist" ofType:nil];
    _dic=[[NSDictionary alloc]initWithContentsOfFile:citiesPath];
    _allName=[[NSMutableArray alloc]init];
    _provName=[_dic allKeys];
    [_allName addObject:_provName];
    for(int i=0;i<_dic.count;i++)
    {
        
        NSArray *name=[_dic valueForKey:_provName[i]];
        [_allName addObject:name];
    }
    _lable=[[UILabel alloc]initWithFrame:CGRectMake(100, 500, 100, 50)];
    [self.view addSubview:_lable];
    _lable.textColor=[UIColor redColor];
    _lable.text=_allName[1][0];
    
    // Do any additional setup after loading the view.
}
//列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return _allName.count-1;
}
//每列行数,component->列
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *com=_allName[component];
    return com.count;
}
//每行显示的字符串,row->行
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSArray *com=_allName[component];
    NSString *name=com[row];
    
    return name;
}
//某列停止滚动后回调此函数
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==0)
    {
         _allName[1]=[_dic valueForKey:_provName[row]];
        _lable.text=_allName[1][0];
        [_lable reloadInputViews];
        [_citiesPicker reloadAllComponents];
    }
   else if(component==1)
   {
       _lable.text=_allName[component][row];
       [_lable reloadInputViews];
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
