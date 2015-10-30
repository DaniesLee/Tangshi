//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "KindModel.h"
#import "KindViewModel.h"
#import "KindViewController.h"
#import "ShiViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) KindViewModel *kindVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (KindViewModel *)kindVM{
    if(!_kindVM){
        _kindVM = [KindViewModel new];
    }
    return _kindVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -UITabelViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.kindVM.rowNumber;
}

kRemoveCellSeparator

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
    label.text = [self.kindVM titleForRow:indexPath.row];
    UIButton *button = (UIButton *)[cell.contentView viewWithTag:200];
    button.hidden = ![self.kindVM hasDetailForRow:indexPath.row];
    button.layer.cornerRadius = 10;
    [button bk_addEventHandler:^(id sender) {
        KindViewController *vc = [KindViewController new];
        vc.introKind = [self.kindVM detailForRow:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        vc.title = label.text;
    } forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ShiViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [_tableView indexPathForCell:sender];
    vc.kind = [self.kindVM kindForRow:indexPath.row];
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
