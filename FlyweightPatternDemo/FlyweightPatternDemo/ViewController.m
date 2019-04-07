//
//  ViewController.m
//  FlyweightPatternDemo
//
//  Created by cs on 2019/4/7.
//  Copyright © 2019 cs. All rights reserved.
//
// 关于享元模式的例子demo

#import "ViewController.h"
#import "FlowerView.h"
#import "FlowerFactory.h"
#import "FlyweightView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self drawFlowerNormal];
    
    // 使用享元模式
    [self drawFlowerFlyweightPattern];
}

// 使用普通模式创建
- (void)drawFlowerNormal {
    // 使用普通模式
    for (int i = 0; i < 100000; i++) {
        @autoreleasepool {
            CGRect screenBounds = [[UIScreen mainScreen] bounds];
            CGFloat x = (arc4random() % (NSInteger)screenBounds.size.width);
            CGFloat y = (arc4random() % (NSInteger)screenBounds.size.height);
            NSInteger minSize = 10;
            NSInteger maxSize = 50;
            CGFloat size = (arc4random() % (maxSize - minSize + 1)) + minSize;
            CGRect area = CGRectMake(x, y, size, size);
            
            FlowerType flowerType = arc4random() % kTotalNumberOfFlowerTypes;
            //新建对象
            UIImageView *imageview = [self flowerViewWithType:flowerType];
            imageview.frame = area;
            [self.view addSubview:imageview];
        }
    }
}

- (UIImageView *)flowerViewWithType:(FlowerType)type {
    UIImageView *flowerView = nil;
    UIImage *flowerImage;
    
    switch (type) {
        case FlowerPeachBlossomType:
            flowerImage = [UIImage imageNamed:@"peachBloss"];
            break;
        case FlowerClubsType:
            flowerImage = [UIImage imageNamed:@"clubs"];
            break;
        case FlowerPenoyType:
            flowerImage = [UIImage imageNamed:@"penoy"];
            break;
        case FlowerCloveType:
            flowerImage = [UIImage imageNamed:@"clove"];
            break;
        case FlowerCuckooType:
            flowerImage = [UIImage imageNamed:@"cuckoo"];
            break;
        case FloweJasmineType:
            flowerImage = [UIImage imageNamed:@"jasmine"];
            break;
        default:
            break;
    }
    
    flowerView = [[UIImageView alloc]initWithImage:flowerImage];
    
    return flowerView;
}

#pragma mark - 使用享元模式

- (void)drawFlowerFlyweightPattern {
    // 使用享元模式
    FlowerFactory *factory = [[FlowerFactory alloc] init];
    NSMutableArray *flowerList = [[NSMutableArray alloc] initWithCapacity:500];
    
    for (int i = 0; i < 100000; ++i) {
        @autoreleasepool {
            FlowerType flowerType = arc4random() % kTotalNumberOfFlowerTypes;
            //重复利用对象
            UIImageView *flowerView = [factory flowerViewWithType:flowerType];
            
            CGRect screenBounds = [[UIScreen mainScreen] bounds];
            CGFloat x = (arc4random() % (NSInteger)screenBounds.size.width);
            CGFloat y = (arc4random() % (NSInteger)screenBounds.size.height);
            NSInteger minSize = 10;
            NSInteger maxSize = 50;
            CGFloat size = (arc4random() % (maxSize - minSize + 1)) + minSize;
            
            CGRect area = CGRectMake(x, y, size, size);
            //新建对象
            NSValue *key = [NSValue valueWithCGRect:area];
            //新建对象
            NSDictionary *dic = [NSDictionary dictionaryWithObject:flowerView forKey:key];
            [flowerList addObject:dic];
        }
    }
    
    FlyweightView *view = [[FlyweightView alloc]initWithFrame:self.view.bounds];
    view.flowerList = flowerList;
    self.view = view;
}

@end
