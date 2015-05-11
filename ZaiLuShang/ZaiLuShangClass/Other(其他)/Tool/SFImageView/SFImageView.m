//
//  SFImageView.m
//  SFLoadImage
//
//  Created by qianfeng on 15/5/7.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFImageView.h"
#import "SDBallProgressView.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#define SCALE 0.4
#define IMAGEVIEW_BACKGROUND [UIColor lightGrayColor]
@implementation SFImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //进度条
        CGFloat progressViewWidth =frame.size.height*0.4;
        CGFloat progressViewHeight =progressViewWidth;
        progressView = [[SDBallProgressView alloc]initWithFrame:CGRectMake(0, 0, progressViewWidth, progressViewHeight)];
        progressView.center = self.center;
        [self addSubview:progressView];
        self.backgroundColor =IMAGEVIEW_BACKGROUND;
        
    }
    return self;
}

-(void)setPlaceHolderImageWithNamed:(NSString *)imageName
{
    //默认图片
    self.image = [UIImage imageNamed:imageName];
}


-(void)setImageWithUrl:(NSURL *)url
{
    //[self sd_setImageWithURL:url];
    
    SDWebImageManager * manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:url options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        CGFloat progress =(CGFloat)receivedSize/(CGFloat)expectedSize;
        if (progress>=0) {
            progressView.progress = progress;
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        [progressView dismiss];
        self.image = image;
    }];
    

}

-(void)setImageWithUrl:(NSString *)url withPlaceHolderImage:(NSString *)placeHolder
{
    [self setImageWithUrl:[NSURL URLWithString:url]];
   // [self setPlaceHolderImageWithNamed:placeHolder];
}
@end
