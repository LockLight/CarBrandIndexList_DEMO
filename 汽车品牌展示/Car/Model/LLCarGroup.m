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
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
