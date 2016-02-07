//
//  SecondViewController.m
//  FirstFollowLineTestMap
//
//  Created by KimTaegeun on 13. 12. 20..
//  Copyright (c) 2013년 u212_pc3. All rights reserved.
//

#import "SecondViewController.h"
#import <sqlite3.h>
#import "Stations.h"
#import "HotViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize persons;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = NSLocalizedString(@"Hot",@"Hot");
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
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
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [persons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Stations *data = [persons objectAtIndex:indexPath.row];
    cell.textLabel.text = data.name;
    cell.imageView.image = [UIImage imageNamed:@"star.png"];
    return cell;
}

//행을 클릭하면 동작하는 함수
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HotViewController *hotViewController = [[HotViewController alloc] init];
    
    Stations *data = [persons objectAtIndex:indexPath.row];
    
    hotViewController.no = data.no.integerValue;
    
    [self.navigationController pushViewController:hotViewController animated:YES];
    
    
}

-(void)readFromDB{
    sqlite3 *database;
    if(persons==nil)
        persons = [[NSMutableArray alloc]init];
    else
        [persons removeAllObjects];
    
    if(sqlite3_open([dbName UTF8String], &database)==SQLITE_OK){
        //Query문 작성
        NSString *sql=[NSString stringWithFormat:@"select * from station where station_no='2' or station_no='5'"];
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
               
                
                //Stationsd 생성해서 값을 지정
                 Stations *person = [[Stations alloc]initWithNo:no name:name latitude:latitude longitude:longitude];
                [persons addObject:person];
            }//while
        }//if
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}
@end
