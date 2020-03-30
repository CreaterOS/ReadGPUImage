#import "GPUImageFilter.h"

/**
 * 设置曝光效果
 */
@interface GPUImageExposureFilter : GPUImageFilter
{
    GLint exposureUniform;
}

// Exposure ranges from -10.0 to 10.0, with 0.0 as the normal level
/* 曝光度 -- 曝光范围(-10.0-10.0),默认值为0.0*/
@property(readwrite, nonatomic) CGFloat exposure; 

@end
