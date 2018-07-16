//
//  hereViewController.m
//  second
//
//  Created by Dream_Dynasty on 2018/7/10.
//  Copyright © 2018年 Dream_Dynasty. All rights reserved.
//

#import "hereViewController.h"
#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "trainsitionTableViewController.h"
@interface hereViewController ()<CLLocationManagerDelegate>
@property(nonatomic,strong)NSString *longitude;
@property(nonatomic,strong)NSString *latitude;
@property(nonatomic,strong)NSString *height;
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)UILabel *longitudeLabel;
@property(nonatomic,strong)UILabel *latitudeLable;
@property(nonatomic,strong)UILabel *heightLable;
@property(nonatomic,strong)UILabel *addressLable;
@end

@implementation hereViewController
-(void)viewWillAppear:(BOOL)animated{
        [self.locationManager startUpdatingLocation];
}
-(void)viewDidDisappear:(BOOL)animated{
    [self.locationManager stopUpdatingLocation];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *backbut=[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 100, 50)];
    [backbut setTitle:@"back" forState:UIControlStateNormal];
    [backbut setTintColor:[UIColor redColor]];
    [backbut addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backbut];
    self.locationManager=[[CLLocationManager alloc]init];
    self.locationManager.delegate=self;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    self.locationManager.distanceFilter=100;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager requestWhenInUseAuthorization];
    _longitudeLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 300, 50)];
    _latitudeLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 200, 300, 50)];
     _heightLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 300, 300, 50)];
    _addressLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 400, 300, 50)];
    _longitudeLabel.textColor=[UIColor blackColor];
    _latitudeLable.textColor=[UIColor blackColor];
    _heightLable.textColor=[UIColor blackColor];
    _addressLable.textColor=[UIColor blackColor];
    [self.view addSubview:_addressLable];
    [self.view addSubview:_longitudeLabel];
    [self.view addSubview:_latitudeLable];
    [self.view addSubview:_heightLable];
    // Do any additional setup after loading the view.
}
//定位成功时调用
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location=[locations lastObject];
    _longitude=[NSString stringWithFormat:@"经度为%f",location.coordinate.longitude];
    _latitude=[NSString stringWithFormat:@"纬度为%f",location.coordinate.latitude];
    _height=[NSString stringWithFormat:@"高度为%f",location.altitude];
    _longitudeLabel.text=_longitude;
    _latitudeLable.text=_latitude;
    _heightLable.text=_height;
    //地址信息反编码
    CLGeocoder *address=[[CLGeocoder alloc]init];
    [address reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(error){
            NSLog(@"error:%@",error.localizedDescription);
        }
        else if([placemarks count]>0){
            CLPlacemark *placemark=placemarks[0];
            self.addressLable.text=placemark.name;
        }
    }];
    
}
//定位失败时候调用
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertController *alert=[[UIAlertController alloc]init];
    alert.message=[NSString stringWithFormat:@"%@",error];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
   
}
-(void)backClick:(UIButton *)but{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)transitionClick:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    trainsitionTableViewController *train=[story instantiateViewControllerWithIdentifier:@"trainsition"];
    [self.navigationController pushViewController:train animated:YES];
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
