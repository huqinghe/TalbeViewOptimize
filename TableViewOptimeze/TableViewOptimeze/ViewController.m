//
//  ViewController.m
//  TableViewOptimeze
//
//  Created by huqinghe on 2017/12/20.
//  Copyright © 2017年 huqinghe. All rights reserved.
//  利用预渲染加速显示iOS图像
/*
 *
 if (!self.image) {
     self.image = [UIImage imageNamed:@"random.jpg"];
     if (NULL != UIGraphicsBeginImageContextWithOptions)
     UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0);
     else
     UIGraphicsBeginImageContext(imageSize);
     [image drawInRect:imageRect];
     self.image = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
 }

 */
#import "ViewController.h"
#import "OptimezeTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}
-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  100;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indef = @"";
    OptimezeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indef];
    if (cell==nil) {
        cell = [[OptimezeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indef];
        NSLog(@"生成新的=section=:%ld,row=%ld",indexPath.section,indexPath.row);
    }
    cell.textLabel.text = [NSString stringWithFormat:@"section=:%ld,row=:%ld",indexPath.section,indexPath.row];
    NSLog(@"cell.tag=:");
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell=");
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSIndexPath
    *ip=[self.tableView indexPathForRowAtPoint:CGPointMake(0,targetContentOffset->y)];
    NSIndexPath
    *cip=[[self.tableView indexPathsForVisibleRows]firstObject];
    NSInteger skipCount=8;
    NSLog(@"ip section=:%ld;row=%ld ",ip.section,ip.row);
    NSLog(@"cip section=:%ld;row=%ld",cip.section,ip.row);
}

@end
