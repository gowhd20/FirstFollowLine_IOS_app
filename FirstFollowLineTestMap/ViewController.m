//
//  ViewController.m
//  FirstFollowLineTestMap
//
//  Created by u212_pc3 on 13. 12. 11..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"
#import <sqlite3.h>
#import "TheSightsData.h"
#import "Stations.h"
#import "ListViewController.h"
@interface ViewController ()

@end

@implementation ViewController{
    CLLocationManager *locationManager;
    int *sightsNo;
}
@synthesize userMapView;
@synthesize annotationsed;






- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if([CLLocationManager locationServicesEnabled]){
        self.userMapView.showsUserLocation=YES;
        [self.userMapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
    
    
    //1)DB파일명을 설정
    dbName = @"/Users/class/Desktop/FirstFollowLineTestMap/namecard";
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL existFile = [fm fileExistsAtPath:dbName];
    if(existFile)
        NSLog(@"파일이 존재");
    else
        NSLog(@"파일이 존재하지 않음");
    
    //2)DB 오픈 DB 조작(데이터를 읽어온다)
    //조작 함수
    [self readFromDB];
    //4)DB close
    //1)내 위치를 지도에 표시하는 것
    if([CLLocationManager locationServicesEnabled]){
        self.userMapView.showsUserLocation=YES;
        [self.userMapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
    // Do any additional setup after loading the view, typically from a nib.
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = NSLocalizedString(@"지도",@"지도");
        
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//annotation을 지도에 나타내기 위한 함수
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MyAnnotation class]]){
        static NSString *annotationIdentifier = @"annotationId1";
        MKAnnotationView *annotationView = [self.userMapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
        annotationView.annotation = annotation;
        
        if(!annotationView){
            annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
        }
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        return annotationView;
    }
    return nil;
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"^^^^111^^");
    ListViewController *listviewController = [[ListViewController alloc] init];
   NSLog(@"^^^^123^^");
    MyAnnotation *ma = (MyAnnotation *) view.annotation;
     NSLog(@"^^^^^^%d",ma.no);
    Stations *data = [persons objectAtIndex:ma.no-1];
    NSLog(@"^^^^^^%d", data.no.intValue);
    listviewController.no = data.no.intValue;

    [self.navigationController pushViewController:listviewController animated:YES];

}


-(void) viewWillAppear:(BOOL)animated{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userMapView.userLocation.coordinate, 0.1, 0.1);
    [userMapView setRegion:viewRegion animated:YES];
}
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"didUpdatingLocation %@", newLocation);
    CLLocation *currentLocation = newLocation;
    if (currentLocation != NULL) {
        MKCoordinateRegion region;
        MKCoordinateSpan span;
        span.latitudeDelta = 0.1;
        span.longitudeDelta = 0.1;
        region.center = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
        region.span = span;
        
        [userMapView setRegion:region animated:YES];
        [userMapView setCenterCoordinate:region.center animated:YES];
        [userMapView regionThatFits:region];
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    float tempLongtitude;
    float tempLatitude;
    NSLog(@"count = %d",persons.count);
    for(int i = 0; i < persons.count; i++){
        Stations *data = [persons objectAtIndex:i];
        
        
        if(userLocation.coordinate.longitude >= data.longitude.doubleValue)
            tempLongtitude = userLocation.coordinate.longitude - data.longitude.doubleValue;
        
        else if(userLocation.coordinate.longitude < data.longitude.doubleValue)
            tempLongtitude = data.longitude.doubleValue - userLocation.coordinate.longitude;
        
        if(userLocation.coordinate.latitude >= data.latitude.doubleValue)
            tempLatitude = userLocation.coordinate.latitude - data.latitude.doubleValue;
        else if(userLocation.coordinate.latitude < data.latitude.doubleValue)
            tempLatitude = data.latitude.doubleValue - userLocation.coordinate.latitude;
       
       if(tempLongtitude <= 0.00278 && tempLatitude <= 0.002222)
        {
            [self readFromDB];
            NSLog(@"여기는들어와dua");
            NSMutableArray *annotations = [[NSMutableArray alloc]initWithCapacity:sights.count];
            [self.userMapView removeAnnotations:annotationsed];
            MyAnnotation *ann = [[MyAnnotation alloc]initWithCoordinate:CLLocationCoordinate2DMake(data.latitude.doubleValue, data.longitude.doubleValue)];
            ann.title = data.name;
            ann.no = data.no.intValue;
            [annotations addObject:ann];
            [self.userMapView addAnnotations:annotations];
            annotationsed = annotations;
            
        }
     
    
    
    }
    
}


-(void)readFromDB{
    sqlite3 *database;
    if(persons==nil)
        persons = [[NSMutableArray alloc]init];
    else
        [persons removeAllObjects];
    
    if(sqlite3_open([dbName UTF8String], &database)==SQLITE_OK){
        //Query문 작성
        NSString *sql=[NSString stringWithFormat:@"select * from station"];
        sqlite3_stmt *compiledStatement;
        
        //Query문 실행(select문 실행=>결과값이 여러행이 리턴됨)
        if(sqlite3_prepare_v2(database, [sql UTF8String], -1, &compiledStatement, NULL)==SQLITE_OK){
            NSLog(@"12");
            //결과행이 존재하는 동안 처리
            while(sqlite3_step(compiledStatement)==SQLITE_ROW) {
                //이름을 획득
                //번호획득
                NSString *no = [NSString stringWithUTF8String:(char*)sqlite3_column_text(compiledStatement, 0)];
                //이름획득
                NSString *name = [NSString stringWithUTF8String:(char*)sqlite3_column_text(compiledStatement, 1)];
                //위도획득
                NSString *latitude = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                //경도획득
                NSString *longitude = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                
                NSLog(@"%@, %@ %@ %@",no,name,latitude,longitude);

                //Stationsd 생성해서 값을 지정
                Stations *person = [[Stations alloc]initWithNo:no name:name latitude:latitude longitude:longitude];
                [persons addObject:person];
            }//while
        }//if
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

-(void)readFromDBSights:(int )number{
    NSLog(@"넘어왔다");
    sqlite3 *database1;
    if(sights==nil)
        sights = [[NSMutableArray alloc]init];
    else
        [sights removeAllObjects];
    
    if(sqlite3_open([dbName UTF8String], &database1)==SQLITE_OK){
        //Query문 작성
       
        NSString *sql=[NSString stringWithFormat:@"select * from the_sights where station_no = %d",number];
        sqlite3_stmt *compiledStatement;
        
        //Query문 실행(select문 실행=>결과값이 여러행이 리턴됨)
        if(sqlite3_prepare_v2(database1, [sql UTF8String], -1, &compiledStatement, NULL)==SQLITE_OK){
            NSLog(@"12");
            //결과행이 존재하는 동안 처리
            while(sqlite3_step(compiledStatement)==SQLITE_ROW) {
                //이름을 획득
                //번호획득
                NSString *no = [NSString stringWithUTF8String:(char*)sqlite3_column_text(compiledStatement, 0)];
                //이름획득
                NSString *name = [NSString stringWithUTF8String:(char*)sqlite3_column_text(compiledStatement, 1)];
                //위도획득
                NSString *latitude = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                //경도획득
                NSString *longitude = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                //정보획득
                NSString *information = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                //이미지획득
                NSString *image= [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];
                //역정보획득
                NSString *station_no = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];
                NSLog(@"%@",image);
                //PersonData생성해서 값을 지정
                TheSightsData *person = [[TheSightsData alloc]initWithNo:no name:name latitude:latitude longitude:longitude information:information image:image station_no:station_no];
                [sights addObject:person];
            }//while
        }//if
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database1);
}

@end
