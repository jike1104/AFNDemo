//
//  ViewController2.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/10.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "ViewController2.h"
#define Weak(weakSelf) __weak typeof(self)weakSelf = self;
@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor greenColor];
    if(![[XGDDataHandle sharedXGDDataHandle] checkNetWorkStatus]){
//        NSLog(@"adgsa");
    } else {
//        NSLog(@"112");
    }
    
//    NSNumber *num = [MGJRouter objectForURL:@"mgj://cart/orderCount"];
//    NSLog(@"objectForURL = %@", num);
    
//    [MGJRouter openURL:@"mgj://foo/bar/传值"];
    
//    [MGJRouter openURL:@"mgj://search/bicycle?color=red"];
    
//    [MGJRouter openURL:@"mgj://category/travel" withUserInfo:@{@"user_id": @9527} completion:^(id result) {
//        NSLog(@"result = %@", result);
//    }];
//    [MGJRouter openURL:@"mgj://"];
    
//    [MGJRouter openURL:@"mgj://detail" completion:^(id result) {
//
////        void (^completion)(id result) = ^(id result){
////        
////        };
////        completion(@"result");
//        NSLog(@"result = %@", result);
//    
//    }];
    
//    [MGJRouter openURL:[MGJRouter generateURLWithPattern:@"mgj://search/:keyword" parameters:@[@"beijing"]]];
//    
//    UIView *tempView = [MGJRouter objectForURL:@"mgj://search_top_bar"];
//    if ([tempView isKindOfClass:[UIView class]]) {
//        NSLog(@"binggo");
//    }
//    [self masonryDemo];
//    [self MBProgressHUDDemo];
    
    
    [self MJRefreshDemo];
}

- (void)MJRefreshDemo {
    __unsafe_unretained id obj0 = nil;
    {
        id obj1 = [[NSObject alloc] init];
        obj0 = obj1;
        NSLog(@"obj1: %@", obj1);
    }
//    NSLog(@"obj0: %@", obj0);
    
    __weak id obj00 = nil;
    {
        id obj11 = [[NSObject alloc] init];
        obj00 = obj11;
        NSLog(@"obj11: %@", obj11);
    }
    NSLog(@"obj00: %@", obj00);

}

- (void)MBProgressHUDDemo {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.label.text = @"loading";
//    /// UIActivityIndicatorView.
//    MBProgressHUDModeIndeterminate,
//    /// A round, pie-chart like, progress view.
//    MBProgressHUDModeDeterminate,
//    /// Horizontal progress bar.
//    MBProgressHUDModeDeterminateHorizontalBar,
//    /// Ring-shaped progress view.
//    MBProgressHUDModeAnnularDeterminate,
//    /// Shows a custom view.
//    MBProgressHUDModeCustomView,
//    /// Shows only labels.
//    MBProgressHUDModeText
//    HUD.detailsLabel.text = @"ParseData";
    HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
    
}

- (void)masonryDemo {
    Weak(weakSelf);
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blackColor];
    [view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//        make.top.equalTo(view).with.offset(20);
//        make.left.equalTo(view).with.offset(20);
//        make.bottom.equalTo(view).with.offset(-20);
//        make.right.equalTo(view).with.offset(-20);
    }];
    
    
    [view1 mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view).with.offset(20);
//        make.left.equalTo(view).with.offset(20);
//        make.bottom.equalTo(view).with.offset(-20);
//        make.right.equalTo(view).with.offset(-20);
    }];
    
    [view1 mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view).with.offset(30);
//        make.left.equalTo(view).with.offset(30);
//        make.bottom.equalTo(view).with.offset(-30);
//        make.right.equalTo(view).with.offset(-30);
        make.top.left.bottom.and.right.equalTo(view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor brownColor];
    [view addSubview:view2];
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    [view addSubview:view3];
    
    int padding1 = 30;
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.left.equalTo(view.mas_left).with.offset(padding1);
        make.right.equalTo(view3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view3);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.left.equalTo(view2.mas_right).with.offset(padding1);
        make.right.equalTo(view.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view2);
    }];

//    int padding = 10;
//    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(view.mas_centerY);
//        make.left.equalTo(view.mas_left).with.offset(padding);
//        make.right.equalTo(view3.mas_left).with.offset(-padding);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(view3);
//    }];
//    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(view.mas_centerY);
//        make.left.equalTo(view2.mas_right).width.offset(padding);
//        make.right.equalTo(view.mas_right).width.offset(-padding);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(view2);
//    }];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    int count = 100;
    UIView *lastView = nil;
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];

    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    [view addSubview:sv11];
    [view addSubview:sv12];
    [view addSubview:sv13];
    [view addSubview:sv21];
    [view addSubview:sv31];
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    [view distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [view distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
        
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
