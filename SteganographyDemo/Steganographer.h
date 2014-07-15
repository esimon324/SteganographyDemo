//
//  Steganographer.h
//  SteganographyDemo
//
//  Created by App-Lab on 7/15/14.
//  Copyright (c) 2014 SteganosarusRextMessaging. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Steganographer : NSObject

@property (nonatomic) NSUInteger messageSize;

-(NSString *)decodeMessage:(UIImage *)img;
-(UIImage *)encodeMessage:(UIImage *)img :(NSString *) message;

@end
