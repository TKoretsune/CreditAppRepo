//
//  iOSCurriculumRegistViewController.m
//  TimeTable
//
//  Created by gucci on 2014/07/08.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import "iOSCurriculumRegistViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"


@implementation iOSCurriculumRegistViewController{
    NSString *picTer_str;
    NSString *picHou_int;
    NSString *picWee_str;
    NSString *picCre_int;
    
    NSString *db_subject;
    NSString *db_teaacher;
    NSString *db_room;
    NSString *db_term;
    NSInteger db_hour;
    NSString *db_week;
    NSInteger db_credit;
    NSString *db_brand;
    NSInteger db_completed;
}
@synthesize preBrand;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _subjectText.delegate = self;
    _teacherText.delegate = self;
    _roomText.delegate = self;
    _termText.delegate = self;
    _hourText.delegate = self;
    _weekText.delegate = self;
    _creditText.delegate = self;

    
    picker1 = [[UIPickerView alloc] init];
    picker1.frame = CGRectMake(0, 420, 320, 216);
    picker1.showsSelectionIndicator = YES;
    picker1.hidden = YES;
    picker1.delegate = self;
    picker1.dataSource = self;
    picker1.tag = 1;
    picker1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:picker1];
    
    picker2 = [[UIPickerView alloc] init];
    picker2.frame = CGRectMake(0, 420, 320, 216);
    picker2.showsSelectionIndicator = YES;
    picker2.hidden = YES;
    picker2.delegate = self;
    picker2.dataSource = self;
    picker2.tag = 2;
    picker2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:picker2];
    
    picker3 = [[UIPickerView alloc] init];
    picker3.frame = CGRectMake(0, 420, 320, 216);
    picker3.showsSelectionIndicator = YES;
    picker3.hidden = YES;
    picker3.delegate = self;
    picker3.dataSource = self;
    picker3.tag = 3;
    picker3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:picker3];

    picker4 = [[UIPickerView alloc] init];
    picker4.frame = CGRectMake(0, 420, 320, 216);
    picker4.showsSelectionIndicator = YES;
    picker4.hidden = YES;
    picker4.delegate = self;
    picker4.dataSource = self;
    picker4.tag = 4;
    picker4.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:picker4];

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //テキストフィールドの編集を始めるときに、ピッカーを呼び出す。
    
    if (textField.tag == 4) {
        
        [self showPicker1];
        
        //キーボードは表示させない
        return NO;
        
    }else if(textField.tag == 5) {
        
        [self showPicker2];
        
        //キーボードは表示させない
        return NO;
    }else if(textField.tag == 6) {
        
        [self showPicker3];
        
        //キーボードは表示させない
        return NO;
    }else if(textField.tag == 7){
        [self showPicker4];
        
        //キーボードは表示させない
        return NO;
    }else{
        return YES;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPicker1 {
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker1.frame = CGRectMake(0, 204, 320, 216);
	[UIView commitAnimations];
	picker1.hidden = NO;
    
	//ナビゲーションバーの右上にdoneボタンを設置する
 	if (!_navi.rightBarButtonItem) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        [_navi setRightBarButtonItem:done animated:YES];
    }
}

- (void)showPicker2 {
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker2.frame = CGRectMake(0, 204, 320, 216);
	[UIView commitAnimations];
	picker2.hidden = NO;
    
	//ナビゲーションバーの右上にdoneボタンを設置する
 	if (!_navi.rightBarButtonItem) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        [_navi setRightBarButtonItem:done animated:YES];
    }
}


- (void)showPicker3 {
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker3.frame = CGRectMake(0, 204, 320, 216);
	[UIView commitAnimations];
	picker3.hidden = NO;
    
	//ナビゲーションバーの右上にdoneボタンを設置する
 	if (!_navi.rightBarButtonItem) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        [_navi setRightBarButtonItem:done animated:YES];
    }
}

- (void)showPicker4 {
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker4.frame = CGRectMake(0, 204, 320, 216);
	[UIView commitAnimations];
	picker4.hidden = NO;
    
	//ナビゲーションバーの右上にdoneボタンを設置する
 	if (!_navi.rightBarButtonItem) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        [_navi setRightBarButtonItem:done animated:YES];
    }
}

- (void)done:(id)sender {
	//ピッカーをしまう
	[self hidePicker];
    
	//doneボタンを消す
    [_navi setRightBarButtonItem:nil animated:YES];
    
}

- (void)hidePicker {
    picker1.hidden = YES;
    picker2.hidden = YES;
    picker3.hidden = YES;
    picker4.hidden = YES;
    
    //ピッカーを下に隠すアニメーション
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker1.frame = CGRectMake(0, 420, 320, 216);
    picker2.frame = CGRectMake(0, 420, 320, 216);
    picker3.frame = CGRectMake(0, 420, 320, 216);
    picker4.frame = CGRectMake(0, 420, 320, 216);
	[UIView commitAnimations];
}

//区切りの数（コンポーネント）
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//コンポーネントの行数を返す
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(pickerView.tag == 1){
        //term
        return 2;
    }else if(pickerView.tag == 2){
        //hour
        return 5;
    }else if(pickerView.tag == 3){
        //week
        return 6;
    }else{
        //単位
        return 3;
    }
}

//表示
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //dbから取得
    if(pickerView.tag == 1){
        NSArray *arr = [[NSArray alloc] initWithObjects:@"前期",@"後期",nil];
        picTer_str = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        return picTer_str;
    }else if(pickerView.tag == 2){
        NSArray *arr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:2],[NSNumber numberWithInteger:3],[NSNumber numberWithInteger:4],[NSNumber numberWithInteger:5],nil];
        picHou_int = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        return picHou_int;
    }else if(pickerView.tag == 3){
        NSArray *arr = [[NSArray alloc] initWithObjects:@"月曜",@"火曜",@"水曜",@"木曜",@"金曜",@"土曜",nil];
        picWee_str = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        return picWee_str;
    }else{
        NSArray *arr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:2],[NSNumber numberWithInteger:4],nil];
        picCre_int = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        return picCre_int;
    }
}

//選択完了時に呼ばれる
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //dbから取得
    
    if(pickerView.tag == 1){
        NSArray *arr = [[NSArray alloc] initWithObjects:@"前期",@"後期",nil];
        picTer_str = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        _termText.text = picTer_str;
    }else if(pickerView.tag == 2){
        NSArray *arr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:2],[NSNumber numberWithInteger:3],[NSNumber numberWithInteger:4],[NSNumber numberWithInteger:5],nil];
        picHou_int = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        _hourText.text=picHou_int;
    }else if(pickerView.tag == 3){
        NSArray *arr = [[NSArray alloc] initWithObjects:@"月曜",@"火曜",@"水曜",@"木曜",@"金曜",@"土曜",nil];
        picWee_str = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        _weekText.text = picWee_str;
    }else{
        //入学年度
        NSArray *arr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:2],[NSNumber numberWithInteger:4],nil];
        picCre_int = [NSString stringWithFormat:@"%@",[arr objectAtIndex:row]];
        _creditText.text = picCre_int;
    }
}


- (IBAction)inputText:(id)sender {
}

- (IBAction)pushButton:(id)sender {
    db_subject = _subjectText.text;
    db_teaacher = _teacherText.text;
    db_room = _roomText.text;
    db_term = _termText.text;
    NSString *tmp = _hourText.text;
    db_hour = [tmp intValue];
    db_week = _weekText.text;
    NSString *tmp2 = _creditText.text;
    db_credit = [tmp2 intValue];
    
    NSLog(@"%d", db_hour);
    NSLog(@"%d", db_credit);
    

    //completeした場合
    db_completed = 1;
    
    
    
    
    
    //??
    //NSLog(@"hoge");
    //db_brand = preBrand;
    //NSLog(@"%@",preBrand);
    db_brand = @"tmp";
    
    
    
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir = [paths objectAtIndex:0];
    FMDatabase *db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"credit.db"]];

    
    NSString *sql = [[NSString alloc] initWithFormat:@"INSERT INTO timetable(term, day, hour, subject, teacher, room, brand, credit, completed) VALUES('%@','%@','%d','%@','%@','%@','%@','%d','%d')", db_term, db_week, db_hour, db_subject, db_teaacher, db_room, db_brand, db_credit, db_completed];
    [db open];
    [db executeUpdate:sql]; //SQL実行
    [db close];
}


-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [_subjectText resignFirstResponder];
    [_teacherText resignFirstResponder];
    [_roomText resignFirstResponder];
    return YES;
}
@end
