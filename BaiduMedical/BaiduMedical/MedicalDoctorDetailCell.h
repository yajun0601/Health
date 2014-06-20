//
//  MedicalDoctorDetailCell.h
//  BaiduMedical
//
//  Created by zhengyajun on 6/20/14.
//  Copyright (c) 2014 zhengyajun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalDoctorDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;

@end
