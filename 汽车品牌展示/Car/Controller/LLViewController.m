//
//  LLViewController.m
//  汽车品牌展示
//
//  Created by locklight on 17/1/3.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLViewController.h"
#import "LLCarGroup.h"

@interface LLViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSArray *carData;
@end

//定义重用标识
static NSString *ID = @"car";
@implementation LLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //添加到根视图
    [self.view addSubview:tableView];
    //加载数据
    self.carData = [self loadData];
    //设置数据源
    tableView.dataSource = self;
    //设置cell注册
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark 数据源方法
//返回多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carData.count;
}
//一组有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取出每一组的模型
    LLCarGroup *carGroup = self.carData[section];
    
    return carGroup.cars.count;
}
//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建CELL
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    //设置数据
    //取到当前组模型
    LLCarGroup *carGroup = self.carData[indexPath.section];
    //取到当前组的当前行数据
    NSString *carName = carGroup.cars[indexPath.row];

    cell.textLabel.text = carName;
    return cell;
}

//返回每一组的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //取到每组的模型数据
    LLCarGroup *group = self.carData[section];
    return group.title;
}

//返回每一组的尾标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    LLCarGroup *group = self.carData[section];
    return group.desc;
}

#pragma mark 加载数据
- (NSArray *)loadData{
    //加载数据存入数组
    NSArray *dictArr =[NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"cars_simple.plist" withExtension:nil]];
    //创建可变数组
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    //遍历字典数组转换为模型
    for (NSDictionary *dict in dictArr) {
        //创建模型对象
        LLCarGroup *carGroup = [LLCarGroup carGroupWithDict:dict];
        //添加至可变数组
        [arrM addObject:carGroup];
    }
    return arrM.copy;
}













@end
