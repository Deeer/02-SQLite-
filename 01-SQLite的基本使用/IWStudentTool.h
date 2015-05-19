//
//  IWStudentTool.h
//  02-SQLite的封装
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  学生数据的CRUD（增删改查）

#import <Foundation/Foundation.h>
@class IWStudent;

@interface IWStudentTool : NSObject

/**
 *  添加学生
 *
 *  @param student 需要添加的学生
 */
+ (BOOL)addStudent:(IWStudent *)student;

/**
 *  获得所有的学生
 *
 *  @return 数组中装着都是IWStudent模型
 */
+ (NSArray *)students;

/**
 *  根据搜索条件获得对应的学生
 *
 *  @param condition 搜索条件
 */
+ (NSArray *)studentsWithCondition:(NSString *)condition;

@end
