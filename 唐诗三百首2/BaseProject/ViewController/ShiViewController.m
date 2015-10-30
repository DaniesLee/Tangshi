//
//  ShiViewController.m
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiViewController.h"
#import "PoetryModel.h"
#import "ShiViewModel.h"
#import "ShiDetailViewController.h"
@interface ShiViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) ShiViewModel *shiVM;

@end

@implementation ShiViewController

-(ShiViewModel *)shiVM{
    if(_shiVM == nil){
        _shiVM = [[ShiViewModel alloc] initWithKind:_kind];
    }
    return _shiVM;    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma - UITableViewDelegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shiVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
    UILabel *titleLb = (UILabel *)[cell.contentView viewWithTag:100];
    titleLb.text = [self.shiVM titleForRow:indexPath.row];
    UILabel *authorLb = (UILabel *)[cell.contentView viewWithTag:200];
    authorLb.text = [self.shiVM authorForRow:indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ShiDetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [_tableView indexPathForCell:sender];
    vc.shi = [self.shiVM shiForRow:indexPath.row];
    vc.introShi = [self.shiVM shiIntroForRow:indexPath.row];
    vc.title = [self.shiVM titleForRow:indexPath.row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
