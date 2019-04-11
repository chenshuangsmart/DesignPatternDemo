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
#import "UIView+Extension.h"

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
/** title*/
@property(nonatomic,strong)NSMutableArray *contents;
/** titles*/
@property(nonatomic,strong)NSMutableArray *titles;
/** sub title*/
@property(nonatomic,strong)NSMutableArray *subTitles;
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
    for (int i = 0; i < 20; i++) {
        NewsModel *model = [[NewsModel alloc] init];
        model.icon = [self.icons objectAtIndex:arc4random_uniform(10)];
        model.title = [self.titles objectAtIndex:arc4random_uniform(10)];
        model.subTitle = [self.subTitles objectAtIndex:arc4random_uniform(10)];
        model.content = [self.contents objectAtIndex:arc4random_uniform(20)];
        NSUInteger index = arc4random_uniform(4);
        NSMutableArray *imgs = [NSMutableArray array];
        for (int i = 0; i < index; i++) {
            [imgs addObject:[self.imgs objectAtIndex:arc4random_uniform(20)]];
        }
        if (imgs.count > 0) {
            model.imgs = imgs.copy;
        }
        model.shareNum = arc4random_uniform(100);
        model.discussNum = arc4random_uniform(100);
        model.likeNum = arc4random_uniform(100);
        [self.dataSource addObject:model];
    }
}

- (void)drawUI {
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;//动态高度
}

#pragma mark - UITableViewDelegate

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollsToTop = true;
        _tableView.backgroundColor = [UIColor whiteColor];;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollsToTop = YES;
        _tableView.estimatedRowHeight = 250;//预估高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[NewsCell class] forCellReuseIdentifier:cellId];
        _tableView.alpha = 0;
    }
    return _tableView;
}

- (NSMutableArray<NewsModel *> *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)icons {
    if (_icons == nil) {
        _icons = [NSMutableArray array];
        [_icons addObject:@"http://img2.imgtn.bdimg.com/it/u=1718891758,1099874998&fm=26&gp=0.jpg"];
        [_icons addObject:@"http://img.zcool.cn/community/01f68156e9044c32f875520fcce16f.jpg"];
        [_icons addObject:@"http://cdn.duitang.com/uploads/item/201510/02/20151002153826_EuhaZ.jpeg"];
        [_icons addObject:@"http://hbimg.b0.upaiyun.com/826efe6e150b57cdbf7b212931bca5f702725a0d5e68-OtrpRK_fw658"];
        [_icons addObject:@"http://img2.imgtn.bdimg.com/it/u=1590474806,2567531124&fm=26&gp=0.jpg"];
        [_icons addObject:@"http://hbimg.b0.upaiyun.com/21a7721b6932c2cd72663b7398571dac817d03f9d171-fcttqZ_fw658"];
        [_icons addObject:@"http://img4.imgtn.bdimg.com/it/u=1276134862,2456438544&fm=26&gp=0.jpg"];
        [_icons addObject:@"http://img5.imgtn.bdimg.com/it/u=1119510787,2846938198&fm=26&gp=0.jpg"];
        [_icons addObject:@"http://b-ssl.duitang.com/uploads/blog/201512/18/20151218174116_JnheE.jpeg"];
        [_icons addObject:@"http://b-ssl.duitang.com/uploads/item/201706/10/20170610104733_Fyc4e.jpeg"];
    }
    return _icons;
}

- (NSMutableArray *)imgs {
    if (_imgs == nil) {
        _imgs = [NSMutableArray array];
        [_imgs addObject:@"http://b-ssl.duitang.com/uploads/item/201801/19/20180119104003_gxfdt.thumb.700_0.jpeg"];
        [_imgs addObject:@"http://b-ssl.duitang.com/uploads/item/201708/09/20170809202725_XPYtZ.thumb.700_0.jpeg"];
        [_imgs addObject:@"http://hbimg.b0.upaiyun.com/b0c46c19483a3d43345a5cbe8ecd150ccdbdc5e31ffab9-SZBawH_fw658"];
        [_imgs addObject:@"http://img3.duitang.com/uploads/item/201606/24/20160624071015_NWeVt.thumb.700_0.jpeg"];
        [_imgs addObject:@"http://b-ssl.duitang.com/uploads/item/201804/23/20180423224748_m4TiK.jpeg"];
        [_imgs addObject:@"http://b-ssl.duitang.com/uploads/item/201805/03/20180503114902_yCSvX.jpeg"];
        [_imgs addObject:@"http://www.banbaowang.com/uploads/allimg/180928/32-1P92QI532.jpg"];
        [_imgs addObject:@"http://img3.doubanio.com/view/photo/l_ratio_poster/public/p2522222464.jpg"];
        [_imgs addObject:@"http://pic1.win4000.com/mobile/2018-04-20/5ad995c938278.jpg"];
        [_imgs addObject:@"http://www.agri35.com/UploadFiles/img_0_22685221_4133134073_26.jpg"];
        [_imgs addObject:@"http://hbimg.b0.upaiyun.com/b0c46c19483a3d43345a5cbe8ecd150ccdbdc5e31ffab9-SZBawH_fw658"];
        [_imgs addObject:@"http://n.sinaimg.cn/sinacn/w531h800/20180113/9763-fyqrewh6778620.jpg"];
        [_imgs addObject:@"http://b-ssl.duitang.com/uploads/item/201801/19/20180119104003_gxfdt.thumb.700_0.jpeg"];
        [_imgs addObject:@"http://res.youth.cn/article_201801_17_176_5a5e9b85a6eaa.jpg"];
        [_imgs addObject:@"http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20171126/13a1e12eb63c44b39ab58d0f01495dba.jpeg"];
        [_imgs addObject:@"http://s1.sinaimg.cn/large/006DeSQezy7g7UtCGgz0b"];
        [_imgs addObject:@"http://www.desktx.com/d/file/phone/love/20180820/2cb7fb5117f57eb8e3ac27f9487415fd.jpg"];
        [_imgs addObject:@"http://b-ssl.duitang.com/uploads/item/201804/19/20180419093634_CnRrx.thumb.700_0.jpeg"];
        [_imgs addObject:@"http://img1.imgtn.bdimg.com/it/u=3535174064,289328435&fm=26&gp=0.jpg"];
        [_imgs addObject:@"http://hbimg.b0.upaiyun.com/5ae2b7df3625988d0b203ad69df0078990c574cc171da-P3b54h_fw658"];
    }
    return _imgs;
}

- (NSMutableArray *)contents {
    if (_contents == nil) {
        _contents = [NSMutableArray array];
        [_contents addObject:@"美国指控阿桑奇犯电脑黑客攻击罪 最高可判五年"];
        [_contents addObject:@"苏丹国防部长宣布已逮捕总统 该国进入3个月紧急状态"];
        [_contents addObject:@"印度大选拉开帷幕：迎接“大考” 莫迪连任胜算几何"];
        [_contents addObject:@"兵马俑在美被损案审判引争议 美国网友：要重审狠判！"];
        [_contents addObject:@"金正恩主持朝鲜七届四中全会 27次提“自力更生”"];
        [_contents addObject:@"美想让中国入美俄核裁条约 外交部:已为国际核裁做重要贡献"];
        [_contents addObject:@"视觉中国官网无法访问 被共青团中央点名后曾道歉"];
        [_contents addObject:@"肉价连降25个月后首涨,仔猪价逼近千元,猪又要“起飞”了？"];
        [_contents addObject:@"故宫新院长啥来头？出身甘肃农村，误入千佛深处"];
        [_contents addObject:@"“996”太累了！广州发文鼓励弹性作息，一周休2.5天可能吗"];
        [_contents addObject:@"赵薇涉诉案件达512起！涉案金额近6千万，庭审耗时两个多月"];
        [_contents addObject:@"神操作！痔疮品牌“肛泰”借黑洞照片做营销 专家:侵权了"];
        [_contents addObject:@"范冰冰名誉权纠纷案再度胜诉！获赔8万精神损失费"];
        [_contents addObject:@"童模遭踢又曝新视频，靠网店店主联合抵制还不够"];
        [_contents addObject:@"信阳8岁女童之死：生前曾说“我妈对我好呢,才打我两次”"];
        [_contents addObject:@"幼儿园要求学生拍“我家的车” 网友:没个好车都不敢生孩子"];
        [_contents addObject:@"最新进展！胜利与朴寒星老公被曝疑挪用公款高达350万元"];
        [_contents addObject:@"天坛奖评委首亮相,评委会主席:北京是中国电影业的核心城市"];
        [_contents addObject:@"不要太累了！广州出台促进消费新政，鼓励错峰休假和弹性作息……"];
        [_contents addObject:@"剧透！未来湾区内的轨道交通出行新动向，这场大会都讲到啦！"];
    }
    return _contents;
}

- (NSMutableArray *)titles {
    if (_titles == nil) {
        _titles = [NSMutableArray array];
        [_titles addObject:@"首页"];
        [_titles addObject:@"国内"];
        [_titles addObject:@"国际"];
        [_titles addObject:@"军事"];
        [_titles addObject:@"财经"];
        [_titles addObject:@"娱乐"];
        [_titles addObject:@"体育"];
        [_titles addObject:@"互联网"];
        [_titles addObject:@"科技"];
        [_titles addObject:@"游戏"];
    }
    return _titles;
}

- (NSMutableArray *)subTitles {
    if (_subTitles == nil) {
        _subTitles = [NSMutableArray array];
        [_subTitles addObject:@"皆大欢喜、逍遥法外"];
        [_subTitles addObject:@"掌上明珠、金玉良缘"];
        [_subTitles addObject:@"八仙过海、相亲相爱"];
        [_subTitles addObject:@"国色天香、绘声绘影"];
        [_subTitles addObject:@"花花公子、簪缨世族"];
        [_subTitles addObject:@"珠光宝气、卧虎藏龙"];
        [_subTitles addObject:@"两小无猜、偷天换日"];
        [_subTitles addObject:@"天下无双、黄道吉日"];
        [_subTitles addObject:@"插翅难逃、春暖花开"];
        [_subTitles addObject:@"兵临城下、满腹经纶"];
    }
    return _subTitles;
}

@end
