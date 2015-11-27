//
//  UIImage+XYZWallpaper.h
//  WallPapers
//
//  Created by tangbl on 15/11/27.
//  Copyright © 2015年 tangbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XYZWallpaper)

- (void)savePhoto;
- (void)setImageAsHomeScreenAndLockScreenClicked;
- (void)setImageAsHomeScreenClicked;
- (void)setImageAsLockScreenClicked;

@end
