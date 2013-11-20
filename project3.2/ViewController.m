//
//  ViewController.m
//  project3.2
//
//  Created by wxl on 13-11-15.
//  Copyright (c) 2013年 wxl. All rights reserved.
//

#import "ViewController.h"
#import "MGridViewController.h"

@interface ViewController ()
{
    int current_state;
}

@property(nonatomic,strong)MGridViewController *mg;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    current_state = 0;
	// Do any additional setup after loading the view, typically from a nib.
    self.mg = [[MGridViewController alloc]initWithNibName:@"MGridViewController" bundle:nil];
    self.mg.view.frame = CGRectMake(10, 100, 300, 300);
    [self.view addSubview:self.mg.view];
    [self.playButton setTitle:NSLocalizedString(@"PLAY", Nil) forState:UIControlStateNormal];
    
    [self.playButton addTarget:self.mg action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAction:(id)sender {
    if (current_state==0) {
        current_state = 1;
        [self.playButton setTitle:NSLocalizedString(@"STOP", nil) forState:UIControlStateNormal];
        [_mg play];
    }else if(current_state == 1)
    {
        current_state = 0;
        [self.playButton setTitle:NSLocalizedString(@"PLAY", nil) forState:UIControlStateNormal];
        [_mg pause];
    }
    
}
@end
