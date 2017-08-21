//
//  RootTabbar.m
//  FirstMovie
//
//  Created by 最爱是深蓝 on 2017/8/21.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "RootTabbar.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "NavController.h"
@interface RootTabbar ()

@end

@implementation RootTabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    
    //创建子控制器
    [self _createSubCtrls] ;
    // Do any additional setup after loading the view.
}
- (void)_createSubCtrls{
    
    
    
    //修改下边文字大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:11],NSFontAttributeName,[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal] ;
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:11],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected] ;
    
    
    //第三级控制器
    
    ViewController1 * info1 = [[ViewController1 alloc] init] ;
    info1.title = @"首页" ;
    UIImage * image = [[UIImage imageNamed:@"icon_tabbar_homepage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    UIImage * selectImage = [[UIImage imageNamed:@"icon_tabbar_homepage_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    info1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:image selectedImage:selectImage] ;
    
   
    ViewController2 * info2 = [[ViewController2 alloc]init] ;
    info2.title=@"商家" ;
    UIImage * image1 = [[UIImage imageNamed:@"icon_tabbar_merchant_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    UIImage * selectImage1 = [[UIImage  imageNamed:@"icon_tabbar_merchant_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    info2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"商家" image:image1 selectedImage:selectImage1] ;
    
    ViewController3 * info3 =[[ViewController3 alloc]init] ;
    info3.title = @"我的" ;
    UIImage * image3 = [[UIImage imageNamed:@"icon_tabbar_mine"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    UIImage * selectImage3 = [[UIImage imageNamed:@"icon_tabbar_mine_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    info3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:image3 selectedImage:selectImage3] ;
    
    //创建数组
   NSArray * viewCtrls = @[info1,info2,info3] ;
    //self.viewControllers = @[info1,info2,info3] ;
    
    
    //创建可变数组 储存导航控制器
   NSMutableArray *navs = [NSMutableArray arrayWithCapacity:viewCtrls.count] ;
    
    //创建二级控制器导航控制器
    for (UIViewController * ctrl in viewCtrls) {
        NavController * nav = [[NavController alloc]initWithRootViewController:ctrl] ;
        
        
        //将导航控制器加入数组中
        [navs addObject:nav] ;
        
        
        
        
        
    }
    //将导航控制器交给标签控制器管理
    self.viewControllers = navs ;
    
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
