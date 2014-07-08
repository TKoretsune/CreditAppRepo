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
    
    picker = [[UIPickerView alloc] init];
    picker.frame = CGRectMake(0, 420, 320, 216);
    picker.showsSelectionIndicator = YES;
    picker.hidden = YES;
    picker.delegate = self;
    picker.dataSource = self;
    [self.view addSubview:picker];
    
    //テキスト1つめ
    _textField1.delegate = self;
    _textField1.tag=1;
    
    
    //テキスト2,3はまだできてない
    
    
    
    
    
    
    
    
    //テキスト2つめ
    _textField2.delegate = self;
    _textField2.tag=2;
    
    
    //テキスト3つめ
    _textField3.delegate = self;
    _textField3.tag=3;
    
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //テキストフィールドの編集を始めるときに、ピッカーを呼び出す。
    [self showPicker];
    
    //キーボードは表示させない
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)showPicker {
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker.frame = CGRectMake(0, 204, 320, 216);
	[UIView commitAnimations];
	picker.hidden = NO;
    
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
    picker.hidden = YES;
    //ピッカーを下に隠すアニメーション
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelegate:self];
	picker.frame = CGRectMake(0, 420, 320, 216);
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
    return [NSString stringWithFormat:@"立命館大学"];
}

//選択完了時に呼ばれる
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //選択行を返す
    NSLog(@"test");
    _textField1.text=[NSString stringWithFormat:@"立命館大学"];
    
    
    //tagで選択できるようにする
    
    _textField2.text=[NSString stringWithFormat:@"立命館大学"];
    
    _textField3.text=[NSString stringWithFormat:@"立命館大学"];
    
}



@end
