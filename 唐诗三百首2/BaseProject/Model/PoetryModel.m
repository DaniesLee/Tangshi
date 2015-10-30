//
//  PoetryModel.m
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PoetryModel.h"

@implementation PoetryModel

+ (NSArray *)poetrysWithKind:(NSString *)kind{
    FMDatabase *db = [self defaultDataBase];
    FMResultSet *rs = [db executeQuery:@"select * from t_shi where d_kind = '%@'",kind];
    NSMutableArray *dataArr = [NSMutableArray new];
    while ([rs next]) {
        PoetryModel *model = [self new];
        model.shi = [rs stringForColumn:@"d_shi"];
        model.kind = [rs stringForColumn:@"d_kind"];
        model.introShi = [rs stringForColumn:@"d_introshi"];
        model.author = [rs stringForColumn:@"d_author"];
        model.ID = [rs longForColumn:@"d_id"];
        model.title = [rs stringForColumn:@"d_title"];
        [dataArr addObject:model];
        NSLog(@"...");
    }
    [[self defaultDataBase] closeOpenResultSets];
    [[self defaultDataBase] close];
    return [dataArr copy];
}

@end
