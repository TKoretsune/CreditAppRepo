//
//  iOSCurriculumRegistViewController.h
//  TimeTable
//
//  Created by gucci on 2014/07/08.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iOSCurriculumRegistViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    UIPickerView *picker1;
    UIPickerView *picker2;
    UIPickerView *picker3;
    UIPickerView *picker4;
    
    NSString *preBrand;
}

@property (nonatomic) NSString *preBrand;

@property (weak, nonatomic) IBOutlet UITextField *subjectText;
@property (weak, nonatomic) IBOutlet UITextField *teacherText;
@property (weak, nonatomic) IBOutlet UITextField *roomText;
@property (weak, nonatomic) IBOutlet UITextField *termText;
@property (weak, nonatomic) IBOutlet UITextField *hourText;
@property (weak, nonatomic) IBOutlet UITextField *weekText;
@property (weak, nonatomic) IBOutlet UITextField *creditText;
@property (weak, nonatomic) IBOutlet UINavigationItem *navi;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)inputText:(id)sender;
- (IBAction)pushButton:(id)sender;

@end
