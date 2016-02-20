//
//  SQPromptBox.m
//  自定义弹框
//
//  Created by 沈强 on 16/2/17.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQPromptBox.h"

@interface SQPromptBox ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *textLabel;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIView *customView;

@end


@implementation SQPromptBox

- (instancetype)initWithImage:(UIImage *)image andText:(NSString *)text {
    self = [super initWithFrame:[self typeFrame]];
    if (self) {
        self.image = image;
        self.text = text;
        self.alpha = 0.0f;
        self.backgroundColor = kBackgroundColor;
        self.layer.cornerRadius = kRound;
        self.coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.coverView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.0f];
        [self.coverView addSubview:self];
        
        [[self getCurrenViewController].view addSubview:self.coverView];
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text {
    return [self initWithImage:nil andText:text];
}

- (instancetype)initWIthCustomView:(UIView *)customView {
    if ([self init]) {
        self.alpha = 0.0f;
        self.coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.coverView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0f];
        self.customView = customView;
        [self addSubview:self.customView];
        [self.coverView addSubview:self];
        [[self getCurrenViewController].view addSubview:self.coverView];
        self.frame = [self customViewFrame];
    }
    return self;
}

/**
 *  显隐提示框
 */
- (void)promptBoxHidenWithView:(SQPromptBox *)view speed:(CGFloat)speed {
    [UIView animateWithDuration:speed animations:^{
        view.coverView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (finished) {
            [view.coverView removeFromSuperview];
        }
    }];
}

/**
 *  动画效果
 */
- (void)presentWithDuration:(CGFloat)duration speed:(CGFloat)speed {
    [UIView animateWithDuration:speed animations:^{
        self.alpha = 1.0f;
        self.coverView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
    } completion:^(BOOL finished) {
        if (finished) {
            if (!self.customView) {
                [self performBlock:^{
                    [self promptBoxHidenWithView:self speed:speed];
                } afterDelay:duration];
            }
        }
    }];
}

/**
 *  计算frame
 */
- (CGRect)typeFrame {
    return CGRectMake((kScreenWidth - kWidth) / 2.0f, (kScreenHeight - kHeight) / 2.0f - 50.0f, kWidth, kHeight);
}

/**
 *  计算CustomFrame
 */
- (CGRect)customViewFrame {
    return CGRectMake((kScreenWidth - self.customView.frame.size.width) / 2.0f, (kScreenHeight - self.customView.frame.size.height) / 2.0f, self.customView.frame.size.width, self.customView.frame.size.height);
}

/**
 *  得到currentViewController
 */
- (UIViewController *)getCurrenViewController {
    UIViewController *currenVIewController = nil;
    
    // 返回一个app的实例，keyWindow(只读)
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *tempWindow in windows) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    // 接受下一个响应者
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        currenVIewController = nextResponder;
    } else {
        currenVIewController = window.rootViewController;
    }
    return currenVIewController;
}

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(callBlockAfterDelay:) withObject:block afterDelay:delay];
}

- (void)callBlockAfterDelay:(void (^)(void))block {
    block();
}

/**
*   重写初始化方法
 */
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_imageView];
        if (self.image != nil) {
            _imageView.image = self.image;
        }
    }
    return _imageView;
}

/**
 *  重写初始化方法
 */
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.userInteractionEnabled = YES;
        _textLabel.font = [UIFont systemFontOfSize:kTextFont];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.textAlignment = NSTextAlignmentLeft;
        _textLabel.numberOfLines = 0;
        [self addSubview:_textLabel];
        if (self.text != nil) {
            _textLabel.text = self.text;
        }
    }
    return _textLabel;
}

- (void)layoutSubviews {
    
    if (!self.customView) {
        CGSize textSize = [self sizeWithText:self.textLabel.text font:self.textLabel.font maxSize:CGSizeMake(kWidth - 2 * kMagin, MAXFLOAT)];
        if (self.imageView.image) {
            self.imageView.frame = CGRectMake((self.frame.size.width - self.image.size.width) / 2.0f, kMagin, self.image.size.width, self.image.size.height);
            self.textLabel.frame = CGRectMake((kWidth - textSize.width) / 2.0f, CGRectGetMaxY(self.imageView.frame) +  kMagin, textSize.width, textSize.height);
            
        }else {
            CGFloat height = textSize.height < kHeight ? kHeight : textSize.height;
            self.textLabel.frame = CGRectMake((kWidth - textSize.width) / 2.0f, kMagin, textSize.width, height);
        }
        CGRect rect = [self typeFrame];
        rect.size.height = CGRectGetMaxY(self.textLabel.frame) + kMagin;
        self.frame = rect;
    }
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
