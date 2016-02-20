//
//  SQPromptBox.h
//  自定义弹框
//
//  Created by 沈强 on 16/2/17.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kBackgroundColor [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.00f]

static CGFloat const kWidth = 180.0f;
static CGFloat const kHeight = 80.0f;
static CGFloat const kRound = 17.0f;
static CGFloat const kTextFont = 16.0f;
static CGFloat const kMagin = 20.0f;

@interface SQPromptBox : UIView

- (instancetype)initWithImage:(UIImage *)image andText:(NSString *)text;

- (instancetype)initWithText:(NSString *)text;

- (instancetype)initWIthCustomView:(UIView *)customView;

- (void)promptBoxHidenWithView:(SQPromptBox *)view speed:(CGFloat)speed;

- (void)presentWithDuration:(CGFloat)duration speed:(CGFloat)speed;

@end
