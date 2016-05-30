//
//  ViewController.m
//  CXCliper
//
//  Created by 柴炫炫 on 16/5/30.
//  Copyright © 2016年 柴炫炫. All rights reserved.
//

#import "ViewController.h"
#import "CXCliper.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *clipedImageView;

@property (nonatomic, strong) CXCliper *cliper;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)startClip
{
    if (!_cliper)
    {
        // 初始化
        _cliper = [[CXCliper alloc] initWithImageView:_imageView];
        
        // 阴影设置
        _cliper.showShadow = YES;
        _cliper.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.25];
        
        // 剪切区域设置
        _cliper.gridFillColor = [UIColor colorWithRed:.5 green:0 blue:0 alpha:.25];
        _cliper.gridBorderColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.65];
        
        // 剪切区域边角设置
        _cliper.showGridCorner = YES;
        _cliper.gridCornerColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        _cliper.gridCornerStyle = GridCornerStyleCircle;
        _cliper.gridCornerWidth = 3;
        _cliper.gridCornerHeight = 10;
        _cliper.gridCornerRadius = 10;
        
        // 剪切区域网格线设置
        _cliper.showGridLine = YES;
        _cliper.gridLineColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:.65];
        _cliper.gridLineWidth = .5;
        
        // 剪切区域网格数设置
        _cliper.gridHorizontalCount = 3;
        _cliper.gridVerticalCount = 3;
    }
}

- (IBAction)clip:(UIButton *)sender
{
    [self startClip];
}

- (IBAction)finish:(UIButton *)sender
{
    _clipedImageView.image = [_cliper getClipImage];
    [self cancel:nil];
}

- (IBAction)cancel:(UIButton *)sender
{
    [_cliper removeFromSuperview];
    _cliper = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

