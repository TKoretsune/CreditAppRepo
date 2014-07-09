//
//  iOSCurriculumSelectViewController.m
//  TimeTable
//
//  Created by gucci on 2014/07/08.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import "iOSCurriculumSelectViewController.h"

@implementation iOSCurriculumSelectViewController

- (void)viewDidLoad
{
    //[self showPicker];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [super viewDidLoad];
    
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

    
    
    
    //テキスト1つめ
    _textField1.delegate = self;
    _textField1.tag=1;
    
    
    //テキスト2つめ
    _textField2.delegate = self;
    _textField2.tag=2;
    
    
    //テキスト3つめ
    _textField3.delegate = self;
    _textField3.tag=3;
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //テキストフィールドの編集を始めるときに、ピッカーを呼び出す。
    
    if (textField.tag == 1) {
        
    [self showPicker1];
    
    //キーボードは表示させない
    return NO;
        
    }else if(textField.tag == 2) {
        
        [self showPicker2];
        
        //キーボードは表示させない
        return NO;
    }else{
        [self showPicker3];
        
        //キーボードは表示させない
        return NO;
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
    
    //ピッカーを下に隠すアニメーション
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker1.frame = CGRectMake(0, 420, 320, 216);
    picker2.frame = CGRectMake(0, 420, 320, 216);
    picker3.frame = CGRectMake(0, 420, 320, 216);
	[UIView commitAnimations];
}







//区切りの数（コンポーネント）
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//コンポーネントの行数を返す
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 1;
}



//表示
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //dbから取得
    if(pickerView.tag == 1){
        return [NSString stringWithFormat:@"立命館大学"];
    }else if(pickerView.tag == 2){
        return [NSString stringWithFormat:@"情報理工学部"];
    }else{
        return [NSString stringWithFormat:@"2014"];
    }
}

//選択完了時に呼ばれる
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //dbから取得
    
    if(pickerView.tag == 1){
        //大学
        _textField1.text=[NSString stringWithFormat:@"立命館大学"];
    }else if(pickerView.tag == 2){
        //学部
        _textField2.text=[NSString stringWithFormat:@"情報理工学部"];
    }else{
        //入学年度
        _textField3.text=[NSString stringWithFormat:@"2014"];
    }
}



@end
