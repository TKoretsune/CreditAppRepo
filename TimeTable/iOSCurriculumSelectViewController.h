//
//  iOSCurriculumSelectViewController.h
//  TimeTable
//
//  Created by gucci on 2014/07/08.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iOSCurriculumSelectViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    UIPickerView *picker;
}

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UINavigationItem *navi;

@end
