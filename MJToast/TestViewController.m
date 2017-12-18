//
//  TestViewController.m
//  MJToast
//
//  Created by YXCZ on 2017/11/28.
//  Copyright © 2017年 JingJing_Lin. All rights reserved.
//

#import "TestViewController.h"
#import "UIView+MJToast.h"
@interface TestViewController ()
@property (assign,nonatomic,getter=isShowingActivity) BOOL  showingActivity;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"Toast";
    self.showingActivity = NO;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    /** 1
    [MJToastManager setQueueEnabled:YES];
    [self.navigationController.view makeToast:@"这是一个测试"];
     */
    
    /** 2
    [self.navigationController.view makeToast:@"第二个提示" duration:3.0 position:MJToastPositionTop];
     */
    
    /** 3
    [self.navigationController.view makeToast:@"第三个提示"
                                     duration:2.0
                                     position:MJToastPositionCenter
                                        title:@"提示："
                                        image:nil
                                        style:nil
                                   completion:nil];
     */
    
    /** 4
    [self extracted];
     
    [self extractedTap];
     */
    
    /** 自定义style 5
    MJToastStyle * style = [[MJToastStyle alloc]initWithDefaultStyle];
    style.messageFont = [UIFont fontWithName:@"Zapfino" size:14.0];
    style.messageColor = [UIColor redColor];
    style.messageAlignment = NSTextAlignmentCenter;
    style.backgroundColor = [UIColor yellowColor];
    
    [self.navigationController.view makeToast:@"自定义提示" duration:3.0 position:MJToastPositionCenter style:style];
     */
    
    /** 自定义视图 6
    [MJToastManager setQueueEnabled:YES];
    UIView * customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 200)];
    [customView setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
    [customView setBackgroundColor:[UIColor orangeColor]];
    [self.navigationController.view showToast:customView duration:3.0 position:MJToastPositionCenter completion:nil];
     */
    
    /** 自定义图片，自定义位置 7
    UIImageView * toastView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"toast"]];
    [self.navigationController.view showToast:toastView
                                     duration:2.0
                                     position:[NSValue valueWithCGPoint:CGPointMake(200, 200)]
                                   completion:nil];
     */
    
    
    if (!self.isShowingActivity) {
        [self.navigationController.view makeToastActivity:MJToastPositionCenter];
    }else{
        [self.navigationController.view hideToastActivity];
    }
    _showingActivity = !self.isShowingActivity;
    
    
}
- (void)extracted {
    [self.navigationController.view makeToast:@"有个图片提示,有个图片提示,有个图片提示。"
                                     duration:2.0
                                     position:MJToastPositionCenter
                                        title:nil
                                        image:[UIImage imageNamed:@"toast"]
                                        style:nil
                                   completion:nil];
}
-(void)extractedTap{
    [self.navigationController.view makeToast:@"有个图片提示,有个图片提示。"
                                     duration:2.0
                                     position:MJToastPositionBottom
                                        title:@"题目："
                                        image:[UIImage imageNamed:@"toast"]
                                        style:nil
                                   completion:^(BOOL didTap) {
                                       if (didTap) {
                                           NSLog(@"completion from tap");
                                       } else {
                                           NSLog(@"completion without tap");
                                       }
                                   }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
