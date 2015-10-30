//
//  ShiViewModel.h
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface ShiViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic,strong) NSArray *shiArr;
@property (nonatomic,strong) NSString *kind;

- (id)initWithKind:(NSString *)kind;
- (NSString *) titleForRow:(NSInteger)row;
- (NSString *) authorForRow:(NSInteger)row;
- (NSString *) shiForRow:(NSInteger) row;
- (NSString *) shiIntroForRow:(NSInteger) row;

@end
