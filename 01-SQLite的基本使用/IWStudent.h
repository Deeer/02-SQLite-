//
//  IWStudent.h
//  02-SQLite的封装
//
//  Created by apple on 14-5-22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWStudent : NSObject
@property (nonatomic, assign) int ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@end
