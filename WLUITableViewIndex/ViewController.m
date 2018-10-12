//
//  ViewController.m
//  WLUITableViewIndex
//
//  Created by 雷王 on 2018/10/12.
//  Copyright © 2018年 WL. All rights reserved.
//

#import "ViewController.h"
#import "DSectionIndexItemView.h"
#import "DSectionIndexView.h"
@interface ViewController ()<DSectionIndexViewDelegate,DSectionIndexViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) DSectionIndexView *sectionIndexView;
@property (strong, nonatomic) NSMutableArray *sections;
@property (strong, nonatomic) NSMutableDictionary *sectionDic;
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, assign) NSInteger selectSection;

@end

@implementation ViewController


#pragma mark - defalt

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self _createData];
    self.selectSection=0;
    [self _initTableView];
    [self _initIndexView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.sectionIndexView reloadItemViews];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


#define kSectionIndexWidth 40.f
#define kSectionIndexHeight 360.f
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _sectionIndexView.frame = CGRectMake(CGRectGetWidth(self.tableview.frame) - kSectionIndexWidth, (CGRectGetHeight(self.tableview.frame) - kSectionIndexHeight)/2, kSectionIndexWidth, kSectionIndexHeight);
    [_sectionIndexView setBackgroundViewFrame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private

- (void)_initIndexView
{
    _sectionIndexView = [[DSectionIndexView alloc] init];
    _sectionIndexView.backgroundColor = [UIColor clearColor];
    _sectionIndexView.dataSource = self;
    _sectionIndexView.delegate = self;
    _sectionIndexView.isShowCallout = NO;
    _sectionIndexView.calloutViewType = CalloutViewTypeForUserDefined;
    _sectionIndexView.calloutDirection = SectionIndexCalloutDirectionLeft;
    _sectionIndexView.calloutMargin = 100.f;
    [self.view addSubview:self.sectionIndexView];
}

- (void)_initTableView
{
    _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    [self.view addSubview:_tableview];
}

- (void)_createData
{
    self.sectionDic = [NSMutableDictionary dictionary];
    NSArray *array1 = [NSArray arrayWithObjects:@"apparel",@"apparentness",@"appel",@"appeasement",@"appearance",@"appear",@"appellant",@"apostate",@"appellation",@"aposteriori",@"apospory ", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"byron",@"SB",nil];
    NSArray *array3 = [NSArray arrayWithObjects:@"cabbage",@"cable",@"cafe", nil];
    NSArray *array4 = [NSArray arrayWithObjects:@"dean",nil];
    NSArray *array5 = [NSArray arrayWithObjects:@"finsh",@"five",@"fine",@"fix", nil];
    NSArray *array6 = [NSArray arrayWithObjects:@"english",@"egg", nil];
    NSArray *array7 = [NSArray arrayWithObjects:@"great",@"gate",@"gif",@"github", nil];
    NSArray *array8 = [NSArray arrayWithObjects:@"hello",@"hungry",@"home",@"house",@"however",@"humble", nil];
    NSArray *array9 = [NSArray arrayWithObjects:@"idea",@"implemention",@"insistt",@"invite", nil];
    NSArray *array10 = [NSArray arrayWithObjects:@"Jack",@"job",@"just", nil];
    NSArray *array11 = [NSArray arrayWithObjects:@"kill",@"king", nil];
    NSArray *array12 = [NSArray arrayWithObjects:@"lucky",@"limit", nil];
    NSArray *array13 = [NSArray arrayWithObjects:@"money",@"much",@"many",@"man",@"million",@"meter",@"may",@"miracle",@"manage",nil];
    NSArray *array14 = [NSArray arrayWithObjects:@"nice",@"nick",@"navigate", nil];
    NSArray *array15 = [NSArray arrayWithObjects:@"ok",@"over",nil];
    NSArray *array16 = [NSArray arrayWithObjects:@"pik",@"pice",@"pizze",nil];
    NSArray *array17 = [NSArray arrayWithObjects:@"quite", nil];
    NSArray *array18 = [NSArray arrayWithObjects:@"request",@"rice",nil];
    NSArray *array19 = [NSArray arrayWithObjects:@"sister",@"sex",@"slider", nil];
    NSArray *array20 = [NSArray arrayWithObjects:@"tool",@"tumb",@"taxi",@"take", nil];
    NSArray *array21 = [NSArray arrayWithObjects:@"unity",@"unless",nil];
    NSArray *array22 = [NSArray arrayWithObjects:@"video",@"vs", nil];
    NSArray *array23 = [NSArray arrayWithObjects:@"world",@"work", nil];
    NSArray *array24 = [NSArray arrayWithObjects:@"XXOO", nil];
    NSArray *array25 = [NSArray arrayWithObjects:@"yellow",@"yet",@"yes",@"yard", nil];
    NSArray *array26 = [NSArray arrayWithObjects:@"zero",@"zike",@"zoom", nil];
    NSArray *array27 = [NSArray arrayWithObjects:@"13579",@"&&&&",@"38",@"250",@"349321810@qq.com",@"码农", nil];
    
    [self.sectionDic setObject:array1 forKey:@"A"];
    [self.sectionDic setObject:array2 forKey:@"B"];
    [self.sectionDic setObject:array3 forKey:@"C"];
    [self.sectionDic setObject:array4 forKey:@"D"];
    [self.sectionDic setObject:array5 forKey:@"E"];
    [self.sectionDic setObject:array6 forKey:@"F"];
    [self.sectionDic setObject:array7 forKey:@"G"];
    [self.sectionDic setObject:array8 forKey:@"H"];
    [self.sectionDic setObject:array9 forKey:@"I"];
    [self.sectionDic setObject:array10 forKey:@"J"];
    [self.sectionDic setObject:array11 forKey:@"K"];
    [self.sectionDic setObject:array12 forKey:@"L"];
    [self.sectionDic setObject:array13 forKey:@"M"];
  
    
    self.sections = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M"/*,@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"*/,nil];
    
}




#pragma mark UITableViewDataSource && delegate method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.sectionDic objectForKey:[self.sections objectAtIndex:section]] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sections objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"IdentifierCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    //    int randomIndex = [self getIndexByRandomRates:[NSArray arrayWithObjects:@152,@3,@98,@188,@250,@365,@798,@45,@32,@15789,@0471,@501,@38,@46,nil ]];
    //    cell.textLabel.text = [NSString stringWithFormat:@"%d",randomIndex];
    cell.textLabel.text = [[self.sectionDic objectForKey:[self.sections objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma mark DSectionIndexViewDataSource && delegate method
- (NSInteger)numberOfItemViewForSectionIndexView:(DSectionIndexView *)sectionIndexView
{
    return self.tableview.numberOfSections;
}

- (DSectionIndexItemView *)sectionIndexView:(DSectionIndexView *)sectionIndexView itemViewForSection:(NSInteger)section
{
    DSectionIndexItemView *itemView = [[DSectionIndexItemView alloc] init];
   
    itemView.titleLabel.text = [self.sections objectAtIndex:section];
    itemView.titleLabel.font = [UIFont systemFontOfSize:12];
    itemView.titleLabel.textColor = [UIColor darkGrayColor];
    itemView.titleLabel.highlightedTextColor = [UIColor redColor];

    itemView.titleLabel.shadowColor = [UIColor whiteColor];
    itemView.titleLabel.shadowOffset = CGSizeMake(0, 1);
    if (section==self.selectSection) {
        itemView.titleLabel.textColor = [UIColor redColor];

    }
    return itemView;
}

//- (UIView *)sectionIndexView:(DSectionIndexView *)sectionIndexView calloutViewForSection:(NSInteger)section
//{
//    UILabel *label = [[UILabel alloc] init];
//
//    label.frame = CGRectMake(0, 0, 80, 80);
//
//    label.backgroundColor = [UIColor clearColor];
//    label.textColor = [UIColor redColor];
//    label.font = [UIFont boldSystemFontOfSize:36];
//    label.text = [self.sections objectAtIndex:section];
//    label.textAlignment = UITextAlignmentCenter;
//
//    [label.layer setCornerRadius:label.frame.size.width/2];
//    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];
//    [label.layer setBorderWidth:3.0f];
//    [label.layer setShadowColor:[UIColor blackColor].CGColor];
//    [label.layer setShadowOpacity:0.8];
//    [label.layer setShadowRadius:5.0];
//    [label.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
//
//
//    return label;
//}

- (NSString *)sectionIndexView:(DSectionIndexView *)sectionIndexView
               titleForSection:(NSInteger)section
{
    return [self.sections objectAtIndex:section];
}

- (void)sectionIndexView:(DSectionIndexView *)sectionIndexView didSelectSection:(NSInteger)section
{
    self.selectSection=section;
    [_sectionIndexView reloadItemViews];
    [self.tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableview) {
        NSArray <UITableViewCell *> *cellArray = [self.tableview  visibleCells];
        //cell的section的最小值
        long cellSectionMINCount = LONG_MAX;
        for (int i = 0; i < cellArray.count; i++) {
            UITableViewCell *cell = cellArray[i];
            long cellSection = [self.tableview indexPathForCell:cell].section;
            if (cellSection < cellSectionMINCount) {
                cellSectionMINCount = cellSection;
            }
        }
        self.selectSection = cellSectionMINCount;
        [_sectionIndexView reloadItemViews];

    }
}

@end
