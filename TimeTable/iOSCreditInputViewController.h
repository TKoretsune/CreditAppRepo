//
//  iOSCreditInputViewController.h
//  TimeTable
//
//  Created by gucci on 2014/07/08.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSCurriculumRegistViewController.h"

@interface iOSCreditInputViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
