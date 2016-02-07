//
//  DetailViewController.m
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 20..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize no, name, latitude, longitude, information, image, station_no;
@synthesize txtName, txtInformation;
@synthesize photo, imgView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", image);
    txtName.text = name;
    txtInformation.text = information;
    photo = [UIImage imageNamed:image];
    
    imgView.image = photo;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
