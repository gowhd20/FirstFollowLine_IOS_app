//
//  MyAnnotation.m
//  FirstFollowLineTestMap
//
//  Created by u212_pc3 on 13. 12. 11..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
@synthesize title, coordinate, no;

-(id)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate{
    self = [super init];
    if(self)
        coordinate = aCoordinate;
    return self;
}

@end
