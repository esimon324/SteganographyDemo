//
//  Steganographer.m
//  SteganographyDemo
//
//  Created by App-Lab on 7/15/14.
//  Copyright (c) 2014 SteganosarusRextMessaging. All rights reserved.
//

#import "Steganographer.h"

@implementation Steganographer

-(NSString *)decodeMessage:(UIImage *)img
{
    CGImageRef imageRef = img.CGImage;
    NSUInteger nWidth = CGImageGetWidth(imageRef);
    NSUInteger nHeight = CGImageGetHeight(imageRef);
    NSUInteger nBytesPerRow = CGImageGetBytesPerRow(imageRef);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef bmContext = CGBitmapContextCreate(NULL, img.size.width, img.size.height, 8,nBytesPerRow, colorSpace, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(bmContext, (CGRect){.origin.x = 0.0f, .origin.y = 0.0f, .size.width = nWidth, .size.height = nHeight}, imageRef);
    
    UInt8* data = (UInt8*)CGBitmapContextGetData(bmContext);
    
    NSData *picStringData = [NSData dataWithBytesNoCopy:data length:_messageSize freeWhenDone:(YES)];
    NSString *picString = [[NSString alloc] initWithData:picStringData encoding:NSUTF8StringEncoding];
    return picString;
}

-(UIImage *)encodeMessage:(UIImage *)img :(NSString *)message
{
    NSData *stringData = [message dataUsingEncoding:NSUTF8StringEncoding];
    UInt8 *stringBits = (UInt8 *)stringData.bytes;
    
    CGImageRef imageRef = img.CGImage;
    NSUInteger nWidth = CGImageGetWidth(imageRef);
    NSUInteger nHeight = CGImageGetHeight(imageRef);
    NSUInteger nBytesPerRow = CGImageGetBytesPerRow(imageRef);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef bmContext = CGBitmapContextCreate(NULL, img.size.width, img.size.height, 8,nBytesPerRow, colorSpace, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(bmContext, (CGRect){.origin.x = 0.0f, .origin.y = 0.0f, .size.width = nWidth, .size.height = nHeight}, imageRef);
    
    UInt8* data = (UInt8*)CGBitmapContextGetData(bmContext);
    _messageSize = stringData.length;

    for (NSUInteger i = 0; i < _messageSize; i++)
    {
        data[i] = stringBits[i];
    }
    CGImageRef newImageRef = CGBitmapContextCreateImage(bmContext);
    UIImage *imageNew = [[UIImage alloc] initWithCGImage:newImageRef];
    return imageNew;
}

@end
