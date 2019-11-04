
//
//  ViewController.m
//  LSPUISection
//
//  Created by carrot__lsp on 2019/10/30.
//  Copyright © 2019 HappyBunnyCarrot. All rights reserved.
//

#import "ViewController.h"
#import "IndexBar.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, IndexBarDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) IndexBar *indexBar;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

#pragma mark - setup subviews
- (void) setupSubviews {
    
    //1.构建数据
    self.dataSource = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 100; i++) {
        [self.dataSource addObject:@(i)];
    }
    
    //2.构建 TableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    //3.构建 IndexBar
    IndexBar *indexBar = [[IndexBar alloc] init];
    indexBar.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 0, 60, [UIScreen mainScreen].bounds.size.height);
    indexBar.dataSource = self;
    [self.view addSubview:indexBar];
    self.indexBar = indexBar;
    
    //4.构建一个 reset 按钮
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [resetButton setTitle:@"刷新" forState:UIControlStateNormal];
    [resetButton setBackgroundColor:[UIColor redColor]];
    [resetButton addTarget:self action:@selector(resetClicked:) forControlEvents:UIControlEventTouchUpInside];
    resetButton.frame = CGRectMake(0, 100, 200, 44);
    [self.view addSubview:resetButton];
}

- (void)resetClicked:(UIButton *)btn {
    NSLog(@"reset");
    [self.indexBar reload];
}

#pragma mark - IndexBar dataSource
- (NSArray *)indexBarDataSoure {
    static BOOL change = NO;
    if (change) {
        change = !change;
        return @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    } else {
        change = !change;
        return @[@"1", @"2", @"3", @"4"];
    }
}



#pragma mark - UITableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifyID = @"reuseID";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifyID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifyID];
//        NSLog(@"创建了 Cell");
    } else {
//        NSLog(@"重用了 Cell");
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

#pragma mark - lazy load method




@end
