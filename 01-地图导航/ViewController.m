//
//  ViewController.m
//  01-地图导航
//
//  Created by Yuchen Wang on 2019/1/28.
//  Copyright © 2019 Yuchen Wang. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *destinationTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 导航按钮点击
- (IBAction)navigateClick:(id)sender {
    
    //
    CLGeocoder *geocoder = [CLGeocoder new];
    
    [geocoder geocodeAddressString:self.destinationTF.text
                 completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                     if(placemarks.count == 0 || error)
                     {
                         return;
                     }
                     // 获取地标对象 暂取最后一个
                     CLPlacemark *pm = placemarks.lastObject;
                     
                     // 创建mkplacemark对象
                     MKPlacemark *mkpm = [[MKPlacemark alloc]initWithPlacemark:pm];
                     //
                     MKMapItem *destinationItem = [[MKMapItem alloc] initWithPlacemark:mkpm];
                     
                     //Withitems: 传入要定位的点
                     //launchOptions: 导航参数
                     
                     NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey : @(MKMapTypeHybrid), MKLaunchOptionsShowsTrafficKey : @(YES)};
                     
                     
                     [MKMapItem openMapsWithItems:@[destinationItem] launchOptions:options];
                     
                 }];
    
    
    // 创建mkplacemark --》clplacemark --〉地理编码来获取clplacemark
//    MKPlacemark *mkpm = [MKPlacemark alloc]initWithPlacemark:<#(nonnull CLPlacemark *)#>
    
    //创建一个mkmapitem --》终点位置
//    MKMapItem *destinationItem = [MKMapItem alloc] initWithPlacemark:<#(nonnull MKPlacemark *)#>
    
//    MKMapItem openMapsWithItems:<#(nonnull NSArray<MKMapItem *> *)#> launchOptions:<#(nullable NSDictionary<NSString *,id> *)#>
//}
}


@end
