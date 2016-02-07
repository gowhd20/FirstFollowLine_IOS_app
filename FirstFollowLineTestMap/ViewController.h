//
//  ViewController.h
//  FirstFollowLineTestMap
//
//  Created by u212_pc3 on 13. 12. 11..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocation.h>


@interface ViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>{
    NSString *dbName;
    NSMutableArray *persons;
    NSMutableArray *sights;
    NSMutableArray *annotationsed;

}
@property (nonatomic, strong)NSMutableArray *persons;
@property (nonatomic, strong)NSMutableArray *sights;


@property (nonatomic, strong)NSString *dbName;
@property (strong, nonatomic) IBOutlet MKMapView *userMapView;
@property (strong, nonatomic)NSMutableArray *annotationsed;

@end
