//
//  ViewController.m
//  FirstMovie
//
//  Created by 最爱是深蓝 on 2017/8/21.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

#import "RootTabbar.h"
@interface ViewController ()

@property (nonatomic, strong) MPMoviePlayerController * player;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    [self SetupVideoPlayer] ;
    // Do any additional setup after loading the view, typically from a nib.
}
// 视频播放
-(void)SetupVideoPlayer{
    
    
    //创建播放器
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:_movURL] ;
    
    [self.view addSubview:self.player.view] ;
    
    //自动播放
    self.player.shouldAutoplay = YES ;
    
    //播放控制：不控制
    [self.player setControlStyle:MPMovieControlStyleNone] ;
    
    //循环播放
    self.player.repeatMode = MPMovieRepeatModeOne ;
    
    //播放器大小
    [self.player.view setFrame:[UIScreen mainScreen].bounds] ;
    
    //透明度
    self.player.view.alpha = 0 ;
    
    
    [UIView animateWithDuration:3 animations:^{
        self.player.view.alpha = 1 ;
        [self.player prepareToPlay] ;
    }] ;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerchanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil] ;
    
    [self diss] ;
}
-(void)diss{
    //进入按钮
    UIButton * btn =[UIButton new] ;
    btn.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 -48, [UIScreen mainScreen].bounds.size.width - 48, 48) ;
    btn.layer.borderWidth = 1 ;
    btn.layer.cornerRadius = 24 ;
    btn.layer.borderColor = [UIColor whiteColor].CGColor ;
    [btn setTitle:@"进入应用" forState:UIControlStateNormal] ;
    btn.alpha = 0 ;
    [self.player.view addSubview:btn] ;
    [btn addTarget:self action:@selector(btnfangfa:) forControlEvents:UIControlEventTouchUpInside] ;
    
    [UIView animateWithDuration:3 animations:^{
        btn.alpha = 1 ;
    }] ;
    
    
    
    
}
- (void)playerchanged
{
    MPMoviePlaybackState playbackstate = [self.player playbackState] ;
    if (playbackstate == MPMoviePlaybackStateStopped || playbackstate ==
        MPMoviePlaybackStatePaused) {
        [self.player play] ;
    }
}

- (void)btnfangfa:(UIButton * )btn
{
    NSLog(@"====进入应用") ;
    RootTabbar * root = [[RootTabbar alloc]init] ;
    self.view.window.rootViewController = root ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
