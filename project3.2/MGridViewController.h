//
//  MGridViewController.h
//  project3.2
//
//  Created by wxl on 13-11-19.
//  Copyright (c) 2013年 wxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridData.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MGridViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (nonatomic,strong) GridData *gridData;

-(void)play;
-(void)pause;
-(void)stop;

- (IBAction)playAction:(UIButton*)sender;

@end
