//
//  SQPromptController.h
//  自定义弹框
//
//  Created by 沈强 on 16/2/17.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SQPromptBox.h"

// 动画时间
static CGFloat const kShowDuration = 1.0f;
// 动画播放速度
static CGFloat const kAnimationSpeed = 0.5f;

typedef BOOL (^IsCoverHiden)(void);

@interface SQPromptController : NSObject

+ (void)showPromptBoxWithCustomView:(UIView *)customView;

+ (void)promptBoxHiden;

// 不会消失，需要手动点击
+ (void)showPromptBoxWithImage:(UIImage *)image text:(NSString *)text;

// 在几秒有消失
+ (void)showPromptBoxWithText:(NSString *)text;

@end
