//
//  HCCommonTool.m
//  HelperCar
//
//  Created by Jentle on 15/9/1.
//  Copyright © 2015年 Jentle. All rights reserved.
//

#import "HCCommonTool.h"
#import <CommonCrypto/CommonDigest.h>

#define radianWithAngel(a) ((a)/180.0*M_PI)

@implementation HCCommonTool

+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString{
    
    return [HCCommonTool colorWithHexColorString:hexColorString alpha:1.0f];
}

+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha
{
    if ([hexColorString length] <6){//长度不合法
        return [UIColor blackColor];
    }
    NSString *tempString=[hexColorString lowercaseString];
    if ([tempString hasPrefix:@"0x"]){//检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }else if ([tempString hasPrefix:@"#"]){//检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] !=6){
        return [UIColor blackColor];
    }
    //分解三种颜色的值
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [tempString substringWithRange:range];
    range.location =2;
    NSString *gString = [tempString substringWithRange:range];
    range.location =4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:alpha];
}

@end
