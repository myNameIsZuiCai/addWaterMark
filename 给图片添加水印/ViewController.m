//
//  ViewController.m
//  给图片添加水印
//
//  Created by 上海均衡 on 2017/1/22.
//  Copyright © 2017年 上海均衡. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
//在图片的基础上绘制一些文字和logo，最终形成一张图片
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //加载图片
    UIImage *image=[UIImage imageNamed:@"123"];
    /* 0、获取上下文（位图的上下文）
     怎么获取位图上下文
        1、绘制原生的图片
        2、给原图片添加文字
        3、生成一张图片
     */
    //开启位图上下文
    //size：新的图片的尺寸
    //opaque:不透明度 YES不透明   NO：透明 一般都选no
    //scale：缩放比例。通常不设置上下文比例，取值为0表示不缩放
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //开始绘制原生图片
    [image drawAtPoint:CGPointZero];
    //给图片添加文字
    NSString *str=@"@微博搞笑排行榜";
    //创建字典
    NSMutableDictionary *textDic=[NSMutableDictionary dictionary];
    textDic[NSForegroundColorAttributeName]=[UIColor redColor];
    textDic[NSFontAttributeName]=[UIFont systemFontOfSize:20];
    
    [str drawAtPoint:CGPointMake(90, 200) withAttributes:textDic];
    //生成一张图片，从上下文中获取
    UIImage *imageWater=UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndPDFContext();
    _imageView.image=imageWater;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
