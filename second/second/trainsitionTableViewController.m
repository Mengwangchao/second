//
//  trainsitionTableViewController.m
//  second
//
//  Created by Dream_Dynasty on 2018/7/12.
//  Copyright © 2018年 Dream_Dynasty. All rights reserved.
//

#import "trainsitionTableViewController.h"
#import "ViewController.h"
#import "trainsition2ViewController.h"
@interface trainsitionTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation trainsitionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray=[[NSMutableArray alloc]init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [_dataArray addObject:@"cube+立方体翻滚效果"];
    [_dataArray addObject:@"moveIn+新视图移到旧视图上面"];
    [_dataArray addObject:@"reveal+将旧视图移开,显示下面的新视图"];
    [_dataArray addObject:@"fade+交叉淡化过渡(不支持过渡方向)"];
    [_dataArray addObject:@"pageCurl+向上翻页效果"];
    [_dataArray addObject:@"pageUnCurl+向下翻页效果"];
    [_dataArray addObject:@"suckEffect+收缩效果，如一块布被抽走(不支持过渡方向)"];
    [_dataArray addObject:@"rippleEffect+滴水效果(不支持过渡方向)"];
    [_dataArray addObject:@"oglFlip+上下左右翻转效果"];
    [_dataArray addObject:@"rotate+风车效果"];
    [_dataArray addObject:@"push+新视图把旧视图推出去"];
    [_dataArray addObject:@"cameraIrisHollowOpen+相机镜头打开效果(不支持过渡方向)"];
    [_dataArray addObject:@"cameraIrisHollowClose+ 相机镜头关上效果(不支持过渡方向)"];
    
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
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *NScell=@"NScell";
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NScell];
    cell.textLabel.text=_dataArray[indexPath.row];

    // Configure the cell...

    return cell;
}



// 是否是可编辑，实现左滑删除需要return yes
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
//左滑后显示的内容
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}


// 点击删除时回调
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
//选定cell时回调
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld个cell被选定了",indexPath.row);
    CATransition *transitionAnimation=[CATransition animation];
    transitionAnimation.duration=1;
    transitionAnimation.fillMode=kCAFillModeForwards;
    transitionAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
   if(indexPath.row==0)
   {
       
       transitionAnimation.type=@"cube";            // 立方体翻滚效果
       transitionAnimation.subtype=kCATransitionFromLeft;  //过度方式，此处为从左侧进入
   }
   else  if(indexPath.row==1)
   {
      transitionAnimation.type=@"moveIn";            // 新视图移到旧视图上面
       transitionAnimation.subtype=kCATransitionFromLeft;  //过度方式,此处为从左侧进入
   }else  if(indexPath.row==2)
   {
       transitionAnimation.type=@"reveal";            // 将旧视图移开,显示下面的新视图
       transitionAnimation.subtype=kCATransitionFromLeft;  //过度方式,此处为从左侧进入
   }else  if(indexPath.row==3)
   {
       transitionAnimation.type=@"fade";            // 交叉淡化过渡(不支持过渡方向)
      // transitionAnimation.subtype=kCATransitionFromLeft;  //过度方式,此处为从左侧进入
   }else  if(indexPath.row==4)
   {
       transitionAnimation.type=@"pageCurl";            //向上翻页效果
      
   }else  if(indexPath.row==5)
   {
       transitionAnimation.type=@"pageUnCurl";            // 向下翻页效果
      
   }else  if(indexPath.row==6)
   {
       transitionAnimation.type=@"suckEffect";            // 收缩效果，如一块布被抽走(不支持过渡方向)
      
   }else  if(indexPath.row==7)
   {
       transitionAnimation.duration=2;
       transitionAnimation.type=@"rippleEffect";            // 滴水效果(不支持过渡方向)
       
   }
   else  if(indexPath.row==8)
   {
       transitionAnimation.type=@"oglFlip";            // 上下左右翻转效果
       
   }
   else  if(indexPath.row==9)
   {
       transitionAnimation.type=@"rotate";            // 风车效果
       
   }
   else  if(indexPath.row==10)
   {
       transitionAnimation.type=@"push";            // 新视图把旧视图推出去
       
   }
   else  if(indexPath.row==11)
   {
       transitionAnimation.type=@"cameraIrisHollowOpen";            // 相机镜头打开效果(不支持过渡方向)
       
   }else  if(indexPath.row==12)
   {
       transitionAnimation.type=@"cameraIrisHollowClose";            // 相机镜头关上效果(不支持过渡方向)
       
   }
   
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    trainsition2ViewController *trainCon=[story instantiateViewControllerWithIdentifier:@"trainsition2"];
    [self.navigationController.view.layer addAnimation:transitionAnimation forKey:nil];
    [self.navigationController pushViewController:trainCon animated:YES];
}
//取消选定cell时回调
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld个cell取消了选定",indexPath.row);
    
}

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
