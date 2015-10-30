//
//  KindViewModel.m
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "KindViewModel.h"

@implementation KindViewModel

- (NSArray *)kinds{
    return [KindModel kinds];
}

- (NSInteger)rowNumber{
    return self.kinds.count;
}

- (KindModel *)kindModelForRow:(NSInteger)row{
    return self.kinds[row];
}

- (NSString*) titleForRow:(NSInteger)row{
    return [self kindModelForRow:row].kind;
}

- (NSString *) detailForRow:(NSInteger) row{
    return [self kindModelForRow:row].introKind;
}

- (NSString *) kindForRow:(NSInteger) row{
    return [self kindModelForRow:row].kind;
}

- (BOOL) hasDetailForRow:(NSInteger) row{
    return [self detailForRow:row].length != 0;
}

@end
