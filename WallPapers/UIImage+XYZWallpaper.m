//
//  UIImage+XYZWallpaper.m
//  WallPapers
//
//  Created by tangbl on 15/11/27.
//  Copyright © 2015年 tangbl. All rights reserved.
//

#import "UIImage+XYZWallpaper.h"

#import <objc/runtime.h>
#import "XYZWallpaperVC.h"
#import "PLWallpaperImageViewController.h"

@implementation UIImage (XYZWallpaper)

- (void)savePhoto {
    UIImageWriteToSavedPhotosAlbum(self, nil,nil, NULL);
}

- (void)setImageAsHomeScreenAndLockScreenClicked {
    [self.xyz_WallpaperVC setImageAsHomeScreenAndLockScreenClicked:nil];
}

- (void)setImageAsHomeScreenClicked {
    [self.xyz_WallpaperVC setImageAsHomeScreenClicked:nil];
}

- (void)setImageAsLockScreenClicked {
    [self.xyz_WallpaperVC setImageAsLockScreenClicked:nil];
}

-(XYZWallpaperVC *)xyz_WallpaperVC {
    
    XYZWallpaperVC *wallPaperVC = [[XYZWallpaperVC alloc] initWithUIImage:self];
    wallPaperVC.allowsEditing = YES;
    wallPaperVC.saveWallpaperData = YES;
    
    return wallPaperVC;
}

@end
