//
//  DetailViewController.h
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 20..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    @public
    NSString *no;
    NSString *name;
    NSString *latitude;
    NSString *longitude;
    NSString *information;
    NSString *image;
    NSString *station_no;
    
    UIImage *photo;
}
@property (nonatomic)NSString *no;
@property (nonatomic)NSString *name;
@property (nonatomic)NSString *latitude;
@property (nonatomic)NSString *longitude;
@property (nonatomic)NSString *information;
@property (nonatomic)NSString *image;
@property (nonatomic)NSString *station_no;
@property (strong, nonatomic)UIImage *photo;
@property (strong, nonatomic) IBOutlet UILabel *txtName;
@property (strong, nonatomic) IBOutlet UITextView *txtInformation;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;


@end
