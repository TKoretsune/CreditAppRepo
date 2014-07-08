//
//  iOSAppDelegate.m
//  TimeTable
//
//  Created by Takehiro Koretsune on 2014/06/26.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import "iOSAppDelegate.h"
#import "FMDatabase.h"

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
        NSString *sql3 = @"CREATE TABLE timetable (id INTEGER PRIMARY KEY AUTOINCREMENT, term TEXT, day TEXT, hour INTEGER, subject TEXT, toom TEXT, brand TEXT, attendance INTEGER, credit INTEGER, completed INTEGER);";
        //userテーブル
        NSString *sql4 = @"CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, university TEXT, department TEXT, discipline TEXT, year INTEGER);";
        [db open]; //DB開く
        [db executeUpdate:sql1]; //SQL実行
        [db executeUpdate:sql2]; //SQL実行
        [db executeUpdate:sql3]; //SQL実行
        [db executeUpdate:sql4]; //SQL実行
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
