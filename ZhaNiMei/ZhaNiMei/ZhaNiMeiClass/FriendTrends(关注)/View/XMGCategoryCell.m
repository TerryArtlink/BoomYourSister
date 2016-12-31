//
//  XMGCategoryCell.m
//  ZhaNiMei
//
//  Created by TysonStone on 2016/12/30.
//  Copyright © 2016年 LightingApp. All rights reserved.
//

#import "XMGCategoryCell.h"

@interface XMGCategoryCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIView *indacatorView;


@end

@implementation XMGCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setModel:(XMGCategoryModel *)model {
    _model = model;
    _nameLabel.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    _nameLabel.textColor = selected ? [UIColor redColor] : [UIColor blackColor];
    _indacatorView.hidden = !selected;
}

@end
