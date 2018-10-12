//
//  DSectionIndexItemView.h
//  TableViewIndex
//
//  Created by 雷王 on 2018/10/12.
//  Copyright © 2018年 WL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSectionIndexItemView : UIView
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, strong) UILabel *titleLabel;

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;//方便在子类里重写该方法
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
@end
