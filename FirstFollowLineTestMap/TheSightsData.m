//
//  TheSightsData.m
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 20..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "TheSightsData.h"

@implementation TheSightsData

@synthesize no, name, latitude, longitude, information, image, station_no;

-(id)initWithNo:(NSString *)n name:(NSString *)na latitude:(NSString *)la longitude:(NSString *)lo information:(NSString *)inf image:(NSString *)im station_no:(NSString *)st{
    no = n;
    name = na;
    latitude = la;
    longitude = lo;
    information = inf;
    image = im;
    station_no = st;
    
    return self;
    
}
@end
