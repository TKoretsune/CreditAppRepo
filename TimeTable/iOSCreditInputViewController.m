//
//  iOSCreditInputViewController.m
//  TimeTable
//
//  Created by gucci on 2014/07/08.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import "iOSCreditInputViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"


@interface iOSCreditInputViewController (){
    NSMutableArray *db_brand;
    NSString *db_subject;
    int db_credit;
    NSString *transferWord;
    iOSCurriculumRegistViewController *viewCon;
}

@end

@implementation iOSCreditInputViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir = [paths objectAtIndex:0];
    FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"credit.db"]];

    //確認
    NSString *sql1 = @"SELECT * FROM curriculum";
    
    [db open];
    FMResultSet *rs = [db executeQuery:sql1];
    //クエリ実行
    int id;
    NSString *text;
    int i=0;
    db_brand = [NSMutableArray arrayWithArray:nil];
    while ([rs next]){
        id = [rs intForColumn:@"id"];
        text = [rs stringForColumn:@"brand"];
        [db_brand addObject:text];
        i++;
    }
    [db close]; //DB閉じる
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1; //とりあえずセクションは1個
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 8; //とりあえず1行だけ表示する
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell;
    //カスタムセルを選ぶ
    cell =  [_tableView dequeueReusableCellWithIdentifier:@"CustumCell"];
    
    
    // タッチイベントを追加
    UIButton *button = (UIButton*)[cell viewWithTag:4];
    
    [button addTarget:self action:@selector(onMyButtonTouch:event:)
            forControlEvents:UIControlEventTouchUpInside];
    
    for(int i=0; i < 8; i++){
        if(indexPath.row == i){
            //各要素にはタグでアクセスする
            UILabel *idLabel1 = (UILabel*)[cell viewWithTag:1];
            idLabel1.text = [db_brand objectAtIndex:i];
            
            UILabel *idLabel2 = (UILabel*)[cell viewWithTag:2];
            idLabel2.text = @"";
            
            UILabel *idLabel3 = (UILabel*)[cell viewWithTag:3];
            idLabel3.text = @"0";
        }
    }
    return cell;
}


//---------------------------------
// ボタンが押された時の処理を記述
//---------------------------------
- (void)onMyButtonTouch: (UIButton *)sender
                  event:(UIEvent *)event
{
    // 押されたボタンのセルのインデックスを取得
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:_tableView];
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:point];
    
    
    //iOSCurriculumRegistViewController *viewCon = (iOSCurriculumRegistViewController *)[segue destinationViewController];
    transferWord = [db_brand objectAtIndex:indexPath.row];
    
    viewCon.preBrand = transferWord;
     //[self performSegueWithIdentifier:@"toRegist" sender:self];
    //渡しかた
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"toRegist"]){
        viewCon = (iOSCurriculumRegistViewController *)[segue destinationViewController];
//        NSLog(@"%@cccccc",transferWord);
//        if([transferWord length] != 0){
//            NSLog(@"%@",transferWord);
//            viewCon.preBrand = [NSString stringWithFormat:@"1"];
//        }else{
//            NSLog(@"%@",transferWord);
//            viewCon.preBrand = [NSString stringWithFormat:@"2"];
//        }
    }
}

@end
