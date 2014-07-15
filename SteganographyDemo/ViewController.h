//
//  ViewController.h
//  SteganographyDemo
//
//  Created by App-Lab on 7/15/14.
//  Copyright (c) 2014 SteganosarusRextMessaging. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Steganographer.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *viewToEncode;
@property (strong, nonatomic) IBOutlet UIImageView *viewToDecode;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UITextField *messageField;
- (IBAction)encode:(id)sender;

@end
