//
//  ViewController.m
//  ReadGPUImg
//
//  Created by Bryant Reyn on 2020/3/25.
//  Copyright © 2020 Bryant Reyn. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *showImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GPUImageMovie *moveFile = [[GPUImageMovie alloc] initWithURL:[NSURL URLWithString:@""]];
    GPUImagePixellateFilter *pixellateFilter = [[GPUImagePixellateFilter alloc] init];
    
    
    /* 将过滤效果添加到moveFile */
    [moveFile addTarget:pixellateFilter];
    
    /* 保存路径 */
    NSString *pathToMovie = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Movie.m4v"];
    unlink([pathToMovie UTF8String]); //删除一个名称
    NSURL *movieURL = [NSURL fileURLWithPath:pathToMovie];
    
    GPUImageMovieWriter *movieWriter = [[GPUImageMovieWriter alloc] initWithMovieURL:movieURL size:CGSizeMake(480.0, 640.0)];
    [pixellateFilter addTarget:movieWriter];
    
    movieWriter.shouldPassthroughAudio = YES;
    moveFile.audioEncodingTarget = movieWriter;
    [moveFile enableSynchronizedEncodingUsingMovieWriter:movieWriter];
    
    [movieWriter startRecording];
    [moveFile startProcessing];

    [pixellateFilter removeTarget:movieWriter];
    [movieWriter finishRecording];
}


- (void)GPUImagestill{
    //处理静态图片
    UIImage *image = [UIImage imageNamed:@"UNADJUSTEDNONRAW_thumb_cf"];
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:image];
    
    //添加褐色效果
    GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
    //    stillImageFilter.intensity = 3.0;
    
    //产生高亮效果
    GPUImageBrightnessFilter *brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
    brightnessFilter.brightness = 0.9;
    
    GPUImageExposureFilter *exposureFilter = [[GPUImageExposureFilter alloc] init];
    exposureFilter.exposure = 4.0;
    
    
    
    
    
    [stillImageSource addTarget:stillImageFilter];
    //必须手动捕捉
    [stillImageFilter useNextFrameForImageCapture];
    
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *currentFilteredVideoFrame = [stillImageFilter imageFromCurrentFramebuffer];
    self.showImg.image = currentFilteredVideoFrame;
}

@end
