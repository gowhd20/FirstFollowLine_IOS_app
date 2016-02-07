//
//  MyAnnotation.h
//  FirstFollowLineTestMap
//
//  Created by u212_pc3 on 13. 12. 11..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject <MKAnnotation>{
    NSString *title;
    int no;
}
@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (nonatomic)NSString *title;
@property (nonatomic)int no;


-(id) initWithCoordinate:(CLLocationCoordinate2D)aCoordinate;

@end
