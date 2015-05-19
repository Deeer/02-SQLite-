//
//  IWViewController.m
//  01-SQLite的基本使用
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWViewController.h"
#import "IWStudent.h"
#import "IWStudentTool.h"

//Core Data : 苹果官方自带，可以让程序员不用写任何一句SQL
//FMDB

@interface IWViewController () <UISearchBarDelegate>
//- (IBAction)insert;
//- (IBAction)update;
//- (IBAction)delete;
//- (IBAction)query;

@property (nonatomic, strong) NSArray *students;
@end

@implementation IWViewController

- (NSArray *)students//懒加载
{
    if (_students == nil) {
        _students = [IWStudentTool students];
    }
    return _students;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //初始化searchBar
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    searchBar.delegate = self;
    self.tableView.tableHeaderView = searchBar;
}

#pragma mark - 搜索框代理
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.students = [IWStudentTool studentsWithCondition:searchText];
    [self.tableView reloadData];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.students.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    static NSString *ID = @"student";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    // 2.设置cell的数据
    IWStudent *stu = self.students[indexPath.row];
    cell.textLabel.text = stu.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", stu.age];
    
    return cell;
}
//
//- (IBAction)insert
//{
//    for (int i = 0; i<30; i++) {
//        // 创建学生
//        IWStudent *student = [[IWStudent alloc] init];
//        student.name = [NSString stringWithFormat:@"Jack-%d", arc4random()%100];
//        student.age = arc4random()%100;
//        
//        // 添加学生
//        BOOL result = [IWStudentTool addStudent:student];
//        
//        if (result) {
//            NSLog(@"添加成功");
//        }
//    }
//}
//
//- (IBAction)update
//{
//
//}
//
//- (IBAction)delete
//{
//    
//}
//
//- (IBAction)query
//{
//    NSArray *students = [IWStudentTool students];
//    
//    for (IWStudent *stu in students) {
//        NSLog(@"%d %@ %d", stu.ID, stu.name, stu.age);
//    }
//}
@end
