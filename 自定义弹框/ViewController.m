//
//  ViewController.m
//  自定义弹框
//
//  Created by 沈强 on 16/2/17.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "ViewController.h"
#import "SQPromptController.h"
#import "CustomView.h"
#define Kwidth self.view.frame.size.width
#define Kheight self.view.frame.size.height

@interface ViewController ()

- (UIButton *)createButtonWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title backgroundImage:(UIImage *)image textColor:(UIColor *)color;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *step1 = [self createButtonWithFrame:CGRectMake((Kwidth - 200) / 2, 150, 200, 40) type:UIButtonTypeCustom title:@"点我啊" backgroundImage:[UIImage imageNamed:@"bkg"] textColor:[UIColor blackColor]];
    [step1 addTarget:self action:@selector(step1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:step1];
    
    UIButton *step2 = [self createButtonWithFrame:CGRectMake((Kwidth - 200) / 2, 220, 200, 40) type:UIButtonTypeCustom title:@"点我啊" backgroundImage:[UIImage imageNamed:@"bkg"] textColor:[UIColor redColor]];
    [step2 addTarget:self action:@selector(step2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:step2];
    
    UIButton *step3 = [self createButtonWithFrame:CGRectMake((Kwidth - 200) / 2, 290, 200, 40) type:UIButtonTypeCustom title:@"点我啊" backgroundImage:[UIImage imageNamed:@"bkg"] textColor:[UIColor blueColor]];
    [step3 addTarget:self action:@selector(step3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:step3];
}

- (void)step1 {
    [SQPromptController showPromptBoxWithImage:[UIImage imageNamed:@"1-1"] text:@"点开有惊喜！"];
}

- (void)step2 {
    [SQPromptController showPromptBoxWithText:@"什么都没有!"];
}

- (void)step3 {
    CustomView *customView = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:nil options:nil].lastObject;
    customView.backgroundColor = [UIColor whiteColor];
    [SQPromptController showPromptBoxWithCustomView:customView];
}

- (IBAction)hidden {
    NSLog(@"sfa");
    [SQPromptController promptBoxHiden];
}

- (UIButton *)createButtonWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title backgroundImage:(UIImage *)image textColor:(UIColor *)color {
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setAdjustsImageWhenHighlighted:NO];
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
