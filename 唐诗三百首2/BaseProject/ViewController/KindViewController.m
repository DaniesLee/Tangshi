//
//  KindViewController.m
//  BaseProject
//
//  Created by soft on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "KindViewController.h"

@interface KindViewController ()

@property (nonatomic,strong) UITextView *textView;

@end

@implementation KindViewController

-(UITextView *)textView{
    if(!_textView){
        _textView = [UITextView new];
        _textView.font = [UIFont systemFontOfSize:18];
        _textView.editable = NO;
    }
    return _textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.textView.text = _introKind;
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
