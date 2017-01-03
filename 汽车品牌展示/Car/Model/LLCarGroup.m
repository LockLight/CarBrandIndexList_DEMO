//
//  LLCarGroup.m
//  汽车品牌展示
//
//  Created by locklight on 17/1/3.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLCarGroup.h"

@implementation LLCarGroup

+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    //创建类对象
    LLCarGroup *carGroup = [[LLCarGroup alloc]init];
    //通过KVO,将字典转换为控件属性
    [carGroup setValuesForKeysWithDictionary:dict];
    return carGroup;
}
@end
