//
//  ViewController.m
//  DesignPatternDemo
//
//  Created by cs on 2019/4/7.
//  Copyright © 2019 cs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /// 迭代器模式
    [self iterator];
}

/// 迭代器模式
- (void)iterator {
    //1.数组迭代器
    NSArray *array = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
    // 获取数组的正序迭代器
    NSEnumerator *enu1 = [array objectEnumerator];
    // 获取数组的反序迭代器
    NSEnumerator *enu2 = [array reverseObjectEnumerator];
    // 遍历数组
    id obj = nil;
    // 正序，获取下一个需要遍历的元素
    while (obj = [enu1 nextObject]) {
        NSLog(@"%@", obj);
    }
    // 反序，获取下一个需要遍历的元素
    while (obj = [enu2 nextObject]) {
        NSLog(@"%@", obj);
    }
}


@end
