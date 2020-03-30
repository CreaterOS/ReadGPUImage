#import "GPUImageSepiaFilter.h"

/**
 * 实现添加褐色滤镜
 */
@implementation GPUImageSepiaFilter

- (id)init;
{
    if (!(self = [super init]))
    {
		return nil;
    }
    
    /* 强度 -- 默认值为1.0 */
    self.intensity = 1.0;
    /* 颜色矩阵 -- GPU(4*4)矩阵 */
    self.colorMatrix = (GPUMatrix4x4){
        {0.3588, 0.7044, 0.1368, 0.0},
        {0.2990, 0.5870, 0.1140, 0.0},
        {0.2392, 0.4696, 0.0912 ,0.0},
        {0,0,0,1.0},
    };

    return self;
}

@end

