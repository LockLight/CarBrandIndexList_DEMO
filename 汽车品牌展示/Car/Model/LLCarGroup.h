//
//  LLCarGroup.h
//  汽车品牌展示
//
//  Created by locklight on 17/1/3.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLCarGroup : NSObject

@property (nonatomic, strong) NSArray *cars;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;


+(instancetype)carGroupWithDict:(NSDictionary *)dict;

@end
