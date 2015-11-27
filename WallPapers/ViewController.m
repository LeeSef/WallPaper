//
//  ViewController.m
//  WallPapers
//
//  Created by tangbl on 15/11/27.
//  Copyright © 2015年 tangbl. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+XYZWallpaper.h"


#import "SVProgressHUD.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *wallpapers;

@property(nonatomic,copy) NSURL *unsplashit;
@property(nonatomic,strong) UIImage *unsplashImage;

@property(nonatomic,strong) UIAlertController *actions;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 计算屏幕大小，设置URL
    CGFloat scale  = [UIScreen mainScreen].scale;
    CGSize  screen = [UIScreen mainScreen].bounds.size;
    self.unsplashit = [NSURL URLWithString:[NSString stringWithFormat:@"https://unsplash.it/%.0f/%.0f/?random",
                                            screen.width*scale,screen.height*scale]];
    
    [self unsplash];
    
    
    // 初始化ActionSheet
    self.actions = [UIAlertController alertControllerWithTitle:@"选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *setLockAction = [UIAlertAction actionWithTitle:@"设定锁定屏幕" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.unsplashImage setImageAsLockScreenClicked];
    }];
    UIAlertAction *setHomeAction = [UIAlertAction actionWithTitle:@"设定主屏幕" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.unsplashImage setImageAsHomeScreenClicked];
    }];
    UIAlertAction *setBothAction = [UIAlertAction actionWithTitle:@"同时设定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.unsplashImage setImageAsHomeScreenAndLockScreenClicked];
    }];
    UIAlertAction *saveToPhotosAction = [UIAlertAction actionWithTitle:@"保存到相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.unsplashImage savePhoto];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.actions dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
    [self.actions addAction:setLockAction];
    [self.actions addAction:setHomeAction];
    [self.actions addAction:setBothAction];
    [self.actions addAction:saveToPhotosAction];
    [self.actions addAction:okAction];
}

#pragma mark - 触发选项
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self presentViewController:self.actions animated:YES completion:nil];
}

#pragma mark - 摇一摇
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        [self unsplash];
    }
}

#pragma mark - 下载壁纸
- (void)unsplash {
    [SVProgressHUD show];
    [self.wallpapers sd_setImageWithURL:self.unsplashit placeholderImage:nil options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [SVProgressHUD dismiss];
        self.unsplashImage = image;
    }];
}

@end
