//
//  LLViewController.m
//  汽车品牌展示
//
//  Created by locklight on 17/1/3.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLViewController.h"
#import "LLCarGroup.h"
#import "LLCars.h"

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
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
    //取出当前车模型数据
    LLCars *cars = carGroup.cars[indexPath.row];

    //取出对应行的车模型属性赋值给cell
    cell.textLabel.text = cars.name;
    cell.imageView.image = [UIImage imageNamed:cars.icon];
    return cell;
}

//返回每一组的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //取到每组的模型数据
    LLCarGroup *group = self.carData[section];
    return group.title;
}

//返回组的索引标题
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    //取出模型数组中每一个模型的title属性并返回一个装有所有title值的数组
    return [self.carData valueForKey:@"title"];
}

//隐藏导航栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark  加载数据
- (NSArray *)loadData{
    //加载数据存入数组
    NSArray *dictArr =[NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"cars_total.plist" withExtension:nil]];
    //创建可变数组储存汽车组字典
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
    //遍历字典数组转换为模型
    for (NSDictionary *groupDict in dictArr) {
        //创建汽车组模型对象
        LLCarGroup *carGroup = [LLCarGroup carGroupWithDict:groupDict];
        //取出当前组中所有汽车的字典数组
        NSArray *carDictArr = carGroup.cars;
        //创建可变数组储存汽车字典
        NSMutableArray *carArrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        for (NSDictionary *carDict in carDictArr) {
            //创建汽车模型
            LLCars *car = [LLCars carWithDict:carDict];
            [carArrM addObject:car];
        }
    //将汽车字典内的模型数组赋值给汽车组的cars属性
        carGroup.cars = carArrM;
    //将汽车组模型添加进模型
        [arrM addObject:carGroup];
    }
    return arrM.copy;
}
@end
