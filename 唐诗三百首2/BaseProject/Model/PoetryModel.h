//
//  PoetryModel.h
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface PoetryModel : BaseModel

@property (nonatomic,strong) NSString *shi;
@property (nonatomic,strong) NSString *introShi;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *kind;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,strong) NSString *title;

+ (NSArray *)poetrysWithKind:(NSString *)kind;

@end
