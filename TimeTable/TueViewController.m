//
//  TueViewController.m
//  TimeTable
//
//  Created by Takehiro Koretsune on 2014/06/26.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import "TueViewController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabasePool.h"
#import "FMDatabaseQueue.h"
#import "sqlite3.h"


@interface TueViewController (){
    int db_id;
    NSString *db_day;
    NSString *db_subject;
    int db_hour;
    
}

@end


@implementation TueViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir = [paths objectAtIndex:0];
    FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"credit.db"]];
    
    //tableの作成
    NSString *sql = @"CREATE TABLE IF NOT EXISTS timetable (id INTEGER PRIMARY KEY AUTOINCREMENT, term TEXT, day TEXT, hour INTEGER, subject TEXT, toom TEXT, brand TEXT, attendance INTEGER, credit INTEGER, completed INTEGER);";
    
    [db open];
    [db executeUpdate:sql];
    [db close];
    
    NSString *day = @"火曜";
    NSString *subject = @"数学";
    NSInteger hour = 2;
    NSString *insert = [[NSString alloc] initWithFormat:@"INSERT INTO timetable(day,hour, subject) VALUES('%@', '%d' , '%@')", day,hour, subject];
    
    [db open];
    [db executeUpdate:insert];
    [db close];
    
    
    
    NSString *select = [[NSString alloc] initWithFormat:@"SELECT * from timetable"];
    //DBを開く場合
    [db open];
    FMResultSet *rs = [db executeQuery:select];
    //クエリ実行
    while ([rs next]){
        db_id = [rs intForColumn:@"id"];
        db_day = [rs stringForColumn:@"day"];
        db_subject = [rs stringForColumn:@"subject"];
        db_hour = [rs intForColumn:@"hour"];
    }
    //DBを閉じる場合
    [db close];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Table Viewの行数を返す
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tvcell = [tableView dequeueReusableCellWithIdentifier: @"cid"];
    if (tvcell == nil) {
        tvcell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier: @"cid"];
    }
    
    
    // Table Viewの各行の情報を、UITableViewCellのオブジェクトとして返す
    
    NSString *Tue = @"火曜";
    
    
    //火曜且つ時限があえば教科を出力
    if (indexPath.row+1 == db_hour &&[db_day isEqualToString:Tue] ) {
        
        tvcell.textLabel.text = [[NSString alloc] initWithFormat:@"%d限        %@ ",indexPath.row + 1 , db_subject];
        
    }
    
    else
    {
        tvcell.textLabel.text = [[NSString alloc] initWithFormat:@"%d限 ",indexPath.row + 1 ];
    }
    
    return tvcell;
    
}
@end