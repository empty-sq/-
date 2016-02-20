//
//  SQPromptController.m
//  自定义弹框
//
//  Created by 沈强 on 16/2/17.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQPromptController.h"

static SQPromptBox *_promptBox;

@interface SQPromptController ()

@end

@implementation SQPromptController

+ (void)showPromptBoxWithCustomView:(UIView *)customView {
    SQPromptBox *promptBox = [[SQPromptBox alloc] initWIthCustomView:customView];
    [promptBox presentWithDuration:kShowDuration speed:kAnimationSpeed];
    _promptBox = promptBox;
}

+ (void)showPromptBoxWithImage:(UIImage *)image text:(NSString *)text {
    SQPromptBox *promptBox = [[SQPromptBox alloc] initWithImage:image andText:text];
    [promptBox presentWithDuration:kShowDuration speed:kAnimationSpeed];
}

+ (void)showPromptBoxWithText:(NSString *)text {
    SQPromptBox *promptBox = [[SQPromptBox alloc] initWithImage:nil andText:text];
    [promptBox presentWithDuration:kShowDuration speed:kAnimationSpeed];
}

+ (void)promptBoxHiden {
    [_promptBox promptBoxHidenWithView:_promptBox speed:kAnimationSpeed];
}

@end
