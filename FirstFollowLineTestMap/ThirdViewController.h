//
//  ThirdViewController.h
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 19..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagObject.h"
#import "ListViewController.h"

@interface ThirdViewController : UIViewController{
    NSMutableArray *sights;
    UIImageView *imageView;
    UIImage *routeImage;
    float _scale;
    UITapGestureRecognizer *_gesture;
    float XPosition;
    float YPosition;
    NSMutableArray *persons;
    NSString *dbName;
    int stationnumber;
}
@property (nonatomic, strong)NSString *dbName;
@property (nonatomic, strong)NSMutableArray *sights;
@property (strong, nonatomic) UIImage *routeImage;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (nonatomic) NSUInteger  numberOfTapsRequired;
@property (nonatomic) NSMutableArray *persons;
@end
