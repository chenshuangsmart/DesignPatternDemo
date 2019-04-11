//
//  ViewController.m
//  MVC-Demo
//
//  Created by cs on 2019/4/11.
//  Copyright © 2019 cs. All rights reserved.
//

#import "ViewController.h"
#import "NewsCell.h"
#import "NewsModel.h"

/**
 关于 MVC 演示的 Demo
 */
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
/** tableView */
@property(nonatomic, strong)UITableView *tableView;
/** dataSource */
@property(nonatomic, strong)NSMutableArray<NewsModel *> *dataSource;
/** icon */
@property(nonatomic, strong)NSMutableArray *icons;
/** imgs */
@property(nonatomic, strong)NSMutableArray *imgs;
@end

static NSString *cellId = @"NewsCellId";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupData];
    // drawUI
    [self drawUI];
}

- (void)setupData {
    
}

- (void)drawUI {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsModel *model = [self.dataSource objectAtIndex:indexPath.row];
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    return cell;
}

#pragma mark - UITableViewDelegate

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollsToTop = true;
        _tableView.backgroundColor = [UIColor whiteColor];;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollsToTop = YES;
        _tableView.rowHeight = 44;
        [_tableView registerClass:[NewsCell class] forCellReuseIdentifier:cellId];
        _tableView.alpha = 0;
    }
    return _tableView;
}


@end
