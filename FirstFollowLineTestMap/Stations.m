//
//  Stations.m
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 20..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "Stations.h"

@implementation Stations
@synthesize no, name, latitude, longitude;

-(id)initWithNo:(NSString *)n name:(NSString *)na latitude:(NSString *)la longitude:(NSString *)lo {
    no = n;
    name = na;
    latitude = la;
    longitude = lo;
    return self;
    
}
@end
