//
//  LLCars.h
//  汽车品牌展示
//
//  Created by locklight on 17/1/3.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLCars : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;

+ (instancetype)carWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
