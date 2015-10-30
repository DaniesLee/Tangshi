//
//  ShiViewModel.m
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiViewModel.h"
#import "PoetryModel.h"
@implementation ShiViewModel

- (id)initWithKind:(NSString *)kind{
    if(self = [super init]){
        _kind = kind;
        
    }
    return self;
}

- (NSArray *)shiArr{
    NSLog(@"%@",_kind);
    return [PoetryModel poetrysWithKind:_kind];
}

- (NSString *)shiForRow:(NSInteger)row{
    NSLog(@"shifor row");
    return [self poetryModelForRow:row].shi;
}

- (NSString *)shiIntroForRow:(NSInteger)row{
    NSLog(@"shi intro for row");
    return [self poetryModelForRow:row].introShi;
}

- (NSInteger)rowNumber{
    return self.shiArr.count;
}

- (PoetryModel *)poetryModelForRow:(NSInteger)row{
    return self.shiArr[row];
}

- (NSString *) titleForRow:(NSInteger)row{
    return [self poetryModelForRow:row].title;
}

- (NSString *) authorForRow:(NSInteger)row{
    return  [self poetryModelForRow:row].author;
}


@end
