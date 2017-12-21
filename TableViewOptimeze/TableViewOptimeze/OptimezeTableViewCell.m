//
//  OptimezeTableViewCell.m
//  TableViewOptimeze
//
//  Created by huqinghe on 2017/12/20.
//  Copyright © 2017年 huqinghe. All rights reserved.
//
#import "OptimezeTableViewCell.h"

@interface OptimezeTableViewCell()
@property(nonatomic,strong)UIImageView* testImageView;
@property(nonatomic,strong)UILabel *testLb;
@end
@implementation OptimezeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        [self.contentView addSubview:self.testImageView];
//        UIGraphicsBeginImageContextWithOptions(_testImageView.bounds.size, NO, 1.0);
//
//        [[UIBezierPath bezierPathWithRoundedRect:_testImageView.bounds cornerRadius:_testImageView.frame.size.width] addClip];
//        [_testImageView drawRect:_testImageView.bounds];
//        _testImageView.image = UIGraphicsGetImageFromCurrentImageContext();
//        //结束画图
//        UIGraphicsEndImageContext();
        
        [self.contentView addSubview:self.textLabel];
        return self;
    }
    else
    {
        return nil;
    }
}
-(UIImageView *)testImageView
{
    if (_testImageView==nil) {
        _testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 70, 70)];
        _testImageView.image = [UIImage imageNamed:@"myImage"];
        

    }
    return _testImageView;
}

-(UILabel*)textLabel
{
    if (_testLb==nil) {
        _testLb = [[UILabel alloc] initWithFrame:self.contentView.bounds];
    }
    return _testLb;
}
-(void)setTestText:(NSString*)txt
{
    self.textLabel.attributedText = [[NSAttributedString alloc] initWithString:txt];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
