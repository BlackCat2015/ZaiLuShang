//
//  SFImageView.h
//  SFLoadImage
//
//  Created by qianfeng on 15/5/7.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SDBallProgressView;
@interface SFImageView : UIImageView
{
    SDBallProgressView * progressView;
}
/*
*  根据URL  设置图片
*
*/
-(void)setImageWithUrl:(NSURL *)url;

//设置站位图片
-(void)setPlaceHolderImageWithNamed:(NSString *)imageName;


-(void)setImageWithUrl:(NSString *)url withPlaceHolderImage:(NSString *)placeHolder;
@end
