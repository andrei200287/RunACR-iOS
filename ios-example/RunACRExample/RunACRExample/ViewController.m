//
//  ViewController.m
//  RunACRExample
//
//  Created by Andrei Solovjev on 24.11.16.
//  Copyright © 2016 RunACR. All rights reserved.
//

#import "ViewController.h"
@import RunACRSDK;

@interface ViewController ()<RunACRDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@property (weak, nonatomic) IBOutlet UIButton *buttonRecognize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelResult.text = @"";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"runacr"];
    [[RunACR sharedInstance] updateDatabasePath:path];
    [RunACR sharedInstance].delegate = self;
    
}



- (IBAction)onRecognize:(id)sender {
    
    [[RunACR sharedInstance] startRecognize];
    _buttonRecognize.hidden = YES;
    _labelResult.text = @"...";
}



#pragma mark - RunACRDelegate
-(void)didRecognize:(int)trackId absoluteTimeOffset:(float)absoluteTimeOffset relativeTimeOffset:(float)relativeTimeOffset{
    NSLog(@"item_id=%d offcet=%f offcet1=%f",trackId, absoluteTimeOffset, relativeTimeOffset);
    
    int seconds = (int)relativeTimeOffset % 60;
    int minutes = ((int)relativeTimeOffset / 60) % 60;
    int hours = relativeTimeOffset / 3600;
    
    NSString *str = [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
    
    if (trackId == 1){
        // iPhone 7 – Design 00:02:43
        _labelResult.text = [NSString stringWithFormat:@"iPhone 7 – Design %@",str];
    } else if (trackId == 2){
        // Samsung - Surf - The Snail 00:03:26
        _labelResult.text = [NSString stringWithFormat:@"Samsung - Surf - The Snail %@",str];
    }
    
    _buttonRecognize.hidden = NO;
    
}


-(void)didNotRecognize{
    _buttonRecognize.hidden = NO;
    _labelResult.text = @"Not Found.";
    //[[RunACR sharedInstance] startRecognize];
}


@end
