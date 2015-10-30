//
//  KindModel.m
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "KindModel.h"

@implementation KindModel

+(NSArray *)kinds{
    FMDatabase *db = [self defaultDataBase];
    FMResultSet *rs = [db executeQuery:@"select * from t_kind"];
    NSMutableArray *dataArr = [NSMutableArray new];
    while ([rs next]) {
        KindModel *model = [KindModel new];
        model.kind = [rs stringForColumn:@"d_kind"];
        model.number = [rs longForColumn:@"d_num"];
        model.introKind = [rs stringForColumn:@"d_introkind"];
        model.introKind2 = [rs stringForColumn:@"d_introkind2"];
        [dataArr addObject:model];
    }
    [[KindModel defaultDataBase] closeOpenResultSets];
    [[KindModel defaultDataBase] close];
    return [dataArr copy];
}

@end
