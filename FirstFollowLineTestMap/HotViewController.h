//
//  HotViewController.h
//  FirstFollowLineTestMap
//
//  Created by class on 13. 12. 20..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotViewController : UITableViewController
{
    NSString *dbName;
    NSMutableArray *persons;
    int no;
}
@property (nonatomic) int no;
@property (nonatomic, strong)NSMutableArray *persons;
@property (nonatomic, strong)NSString *dbName;

@end
