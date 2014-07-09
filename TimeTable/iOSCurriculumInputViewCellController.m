//
//  iOSCurriculumInputViewCellController.m
//  TimeTable
//
//  Created by gucci on 2014/07/09.
//  Copyright (c) 2014年 是常 雄大. All rights reserved.
//

#import "iOSCurriculumInputViewCellController.h"

@implementation iOSCurriculumInputViewCellController


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"hoge");
    
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    UILabel *label1 = (UILabel*)[cell viewWithTag:1];
    UILabel *label2 = (UILabel*)[cell viewWithTag:2];
    //UILabel *label3 = (UILabel*)[cell viewWithTag:3];
    
    label1.text = [[NSString alloc] initWithFormat:@"Section %d", indexPath.section];
    label2.text = [[NSString alloc] initWithFormat:@"Row %d", indexPath.row];
    
    return cell;
}




@end
