#import "GPUImageFilter.h"

/**
 * 实现调整图像的亮度
 */
@interface GPUImageBrightnessFilter : GPUImageFilter
{
    GLint brightnessUniform;
}

// Brightness ranges from -1.0 to 1.0, with 0.0 as the normal level
/* 设置亮度级别 -- 亮度范围从-1.0 -- 1.0，默认级别是0.0 */
@property(readwrite, nonatomic) CGFloat brightness; 

@end
