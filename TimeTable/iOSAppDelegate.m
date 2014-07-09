//
//  iOSAppDelegate.m
//  TimeTable
//
//  Created by Takehiro Koretsune on 2014/06/26.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import "iOSAppDelegate.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"


@implementation iOSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
   
    //tests
    
    //データベースの作成
    //テーブル4つ作成しておく
    //DBファイルのパス
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    //DBファイルがあるかどうか確認
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"credit.db"]])
    {
        //なければ新規作成
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"credit.db"]];
        //curriculumテーブル
        NSString *sql1 = @"CREATE TABLE curriculum (id INTEGER PRIMARY KEY AUTOINCREMENT, university TEXT, department TEXT, discipline TEXT, year INTEGER, brand TEXT);";
        //compositionテーブル
        NSString *sql2 = @"CREATE TABLE composition (id INTEGER PRIMARY KEY AUTOINCREMENT, brand TEXT, parent_brand TEXT, credit INTEGER);";
        //timeテーブル
        NSString *sql3 = @"CREATE TABLE timetable (id INTEGER PRIMARY KEY AUTOINCREMENT, term TEXT, day TEXT, hour INTEGER, subject TEXT, teacher TEXT, room TEXT, brand TEXT, attendance INTEGER, credit INTEGER, completed INTEGER);";
        //userテーブル
        NSString *sql4 = @"CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, university TEXT, department TEXT, discipline TEXT, year INTEGER);";
        
        
        
        
        
        //立命限定
        //立命のカリキュラムをテーブルに追加
        NSString *sql5 = @"INSERT INTO curriculum(university, department, discipline, year, brand) VALUES(?,?,?,?,?)";
        
        
        //立命、情理限定
        //立命のcompositoinをテーブルに追加
        NSString *sql6 = @"INSERT INTO composition(brand, parent_brand, credit)";
        
        
        //確認
        NSString *sql7 = @"SELECT * FROM curriculum";
        
        
        [db open]; //DB開く
        [db executeUpdate:sql1]; //SQL実行
        [db executeUpdate:sql2]; //SQL実行
        [db executeUpdate:sql3]; //SQL実行
        [db executeUpdate:sql4]; //SQL実行
        
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"卒業単位数"]; //SQL実行
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"外国語科目"]; //SQL実行
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"教養科目"]; //SQL実行
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"専門科目"]; //SQL実行
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"専門基礎科目"]; //SQL実行
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"共通専門科目"]; //SQL実行
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"学科専門科目"]; //SQL実行
        [db executeUpdate:sql5, @"立命館大学", @"情報理工学部", @"情報システム学科",[NSNumber numberWithInteger:2014], @"その他"]; //SQL実行
        
        

        [db executeUpdate:sql6, @"卒業単位数", nil, [NSNumber numberWithInteger:124]];
        [db executeUpdate:sql6, @"外国語科目", @"卒業単位数", [NSNumber numberWithInteger:10]];
        [db executeUpdate:sql6, @"教養科目", @"卒業単位数", [NSNumber numberWithInteger:14]];
        [db executeUpdate:sql6, @"専門科目", @"卒業単位数", [NSNumber numberWithInteger:100]];
        [db executeUpdate:sql6, @"専門基礎科目", @"専門科目", [NSNumber numberWithInteger:12]];
        [db executeUpdate:sql6, @"共通専門科目", @"専門科目", [NSNumber numberWithInteger:32]];
        [db executeUpdate:sql6, @"学科専門科目", @"専門科目", [NSNumber numberWithInteger:46]];
        [db executeUpdate:sql6, @"その他", @"卒業単位数", [NSNumber numberWithInteger:0]];
        
        
        
        FMResultSet *rs = [db executeQuery:sql7];
        //クエリ実行
        int id;
        NSString *text;
        while ([rs next]){
            id = [rs intForColumn:@"id"];
            text = [rs stringForColumn:@"university"];
            NSLog(@"hoge");
            NSLog(@"%d,%@", id, text);
        }

        
        
        [db close]; //DB閉じる
    }
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
