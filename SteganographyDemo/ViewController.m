//
//  ViewController.m
//  SteganographyDemo
//
//  Created by App-Lab on 7/15/14.
//  Copyright (c) 2014 SteganosarusRextMessaging. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)encode:(id)sender
{
    [self.view endEditing:YES];
    Steganographer *steg = [[Steganographer alloc] init];
    _viewToDecode.image = [steg encodeMessage:_viewToEncode.image :_messageField.text];
    _headerLabel.text = @"Encoded Image";
    _resultLabel.text = [steg decodeMessage:_viewToDecode.image];
}
@end
