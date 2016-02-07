//
//  Stations.h
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 20..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stations : NSObject{
    NSString *no;
    NSString *name;
    NSString *latitude;
    NSString *longitude;
}

@property (strong, nonatomic) NSString *no;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;

-(id)initWithNo:(NSString *)n name:(NSString *)na latitude:(NSString *)la longitude:(NSString *)lo;

@end
