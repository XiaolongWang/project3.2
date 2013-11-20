//
//  MGridViewController.m
//  project3.2
//
//  Created by wxl on 13-11-19.
//  Copyright (c) 2013年 wxl. All rights reserved.
//

#import "MGridViewController.h"
#import "WXLButton.h"

#define CLM_WIGHT 45
#define CLM_TAG_BASE 2000
#define CELL_TAG_BASE 100

@interface MGridViewController ()
{
    int sum_row;
    int sum_clm;
    float clm_wight;
    
    SystemSoundID sound0;
    SystemSoundID sound1;
    SystemSoundID sound2;
    SystemSoundID sound3;
    SystemSoundID sound4;
    SystemSoundID sound5;
    SystemSoundID sound6;
    SystemSoundID sound7;
    SystemSoundID sound8;
    SystemSoundID sound9;
    SystemSoundID sound10;
    SystemSoundID sound11;
    SystemSoundID sound12;
    SystemSoundID sound13;
    SystemSoundID sound14;
    SystemSoundID sound15;
    SystemSoundID sound16;
    SystemSoundID sound17;
    SystemSoundID sound18;
    SystemSoundID sound19;
    SystemSoundID sound20;
    SystemSoundID sound21;
}

@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)NSInteger currentStep;
@property(nonatomic,assign)int current_state;

-(void)initGrid;

-(UIScrollView*)getCLMAtPoint:(Point*)p;

-(UIView*)getCellWithRow:(int)row Clm:(int)clm;

-(void)addClmAt:(int)clm;
    
-(void)clickAction:(id)sender;

//记录点击按钮的位置
-(void)recordInfoWithX:(int)x Y:(int)y;

//点击动画
-(void)clickAnmition;

-(void) playAudio:(NSInteger)sound;

@end

@implementation MGridViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //NSLog(@"x=%g,y=%g,w=%g,h=%g",self.view.bounds.origin.x,self.view.bounds.origin.y,self.view.bounds.size.width,self.view.bounds.size.height);
    [self loadSounds];
    [self initGrid];
    self.currentStep = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadSounds
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"0" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound0);
    soundPath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound1);
    soundPath = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound2);
    soundPath = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound3);
    soundPath = [[NSBundle mainBundle] pathForResource:@"4" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound4);
    soundPath = [[NSBundle mainBundle] pathForResource:@"5" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound5);
    soundPath = [[NSBundle mainBundle] pathForResource:@"6" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound6);
    soundPath = [[NSBundle mainBundle] pathForResource:@"7" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound7);
    soundPath = [[NSBundle mainBundle] pathForResource:@"8" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound8);
    soundPath = [[NSBundle mainBundle] pathForResource:@"9" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound9);
    soundPath = [[NSBundle mainBundle] pathForResource:@"10" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound10);
    soundPath = [[NSBundle mainBundle] pathForResource:@"11" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound11);
    soundPath = [[NSBundle mainBundle] pathForResource:@"12" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound12);
    soundPath = [[NSBundle mainBundle] pathForResource:@"13" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound13);
    soundPath = [[NSBundle mainBundle] pathForResource:@"14" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound14);
    soundPath = [[NSBundle mainBundle] pathForResource:@"15" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound15);
    soundPath = [[NSBundle mainBundle] pathForResource:@"16" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound16);
    soundPath = [[NSBundle mainBundle] pathForResource:@"17" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound17);
    soundPath = [[NSBundle mainBundle] pathForResource:@"18" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound18);
    soundPath = [[NSBundle mainBundle] pathForResource:@"19" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound19);
    soundPath = [[NSBundle mainBundle] pathForResource:@"20" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound20);
    soundPath = [[NSBundle mainBundle] pathForResource:@"21" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath:soundPath]), &sound21);
}

-(void) playAudio:(NSInteger)sound
{
    switch (sound) {
        case 0:
            AudioServicesPlaySystemSound(sound0);
            break;
        case 1:
            AudioServicesPlaySystemSound(sound1);
            break;
        case 2:
            AudioServicesPlaySystemSound(sound2);
            break;
        case 3:
            AudioServicesPlaySystemSound(sound3);
            break;
        case 4:
            AudioServicesPlaySystemSound(sound4);
            break;
        case 5:
            AudioServicesPlaySystemSound(sound5);
            break;
        case 6:
            AudioServicesPlaySystemSound(sound6);
            break;
        case 7:
            AudioServicesPlaySystemSound(sound7);
            break;
        case 8:
            AudioServicesPlaySystemSound(sound8);
            break;
        case 9:
            AudioServicesPlaySystemSound(sound9);
            break;
        case 10:
            AudioServicesPlaySystemSound(sound10);
            break;
        case 11:
            AudioServicesPlaySystemSound(sound11);
            break;
        case 12:
            AudioServicesPlaySystemSound(sound12);
            break;
        case 13:
            AudioServicesPlaySystemSound(sound13);
            break;
        case 14:
            AudioServicesPlaySystemSound(sound14);
            break;
        case 15:
            AudioServicesPlaySystemSound(sound15);
            break;
        case 16:
            AudioServicesPlaySystemSound(sound16);
            break;
        case 17:
            AudioServicesPlaySystemSound(sound17);
            break;
        case 18:
            AudioServicesPlaySystemSound(sound18);
            break;
        case 19:
            AudioServicesPlaySystemSound(sound19);
            break;
        case 20:
            AudioServicesPlaySystemSound(sound20);
            break;
        case 21:
            AudioServicesPlaySystemSound(sound21);
            break;
    }
    
}

-(void)initGrid
{
    sum_row = 7;
    sum_clm = 14;
    int cal = self.view.bounds.size.width/CLM_WIGHT +0.5;
    clm_wight = self.view.bounds.size.width/cal;
    for (int i = 0; i<sum_clm; i++) {
        [self addClmAt:i];
    }
    if (sum_clm*clm_wight>_scrollview.contentSize.width) {
        [self.scrollview setContentSize:CGSizeMake(sum_clm*clm_wight, self.view.bounds.size.height)];
    }
    
    self.gridData = [[GridData alloc]init];
    self.gridData.speed = 0.5;
    self.gridData.lastClmNum = -1;
    
    
}

-(void)addClmAt:(int)clm
{
    float x = clm * clm_wight;
    float y = 0;
    Point p;
    p.h = x;
    p.v = y;
    
    [self.scrollview addSubview:[self getCLMAtPoint:&p]];
}
//初始化一列
-(UIScrollView*)getCLMAtPoint:(Point *)p
{
    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(p->h, p->v, clm_wight, self.view.bounds.size.height)];
    sv.pagingEnabled = YES;
    sv.showsVerticalScrollIndicator = NO;
    [sv setContentSize:CGSizeMake(sv.frame.size.width, sv.frame.size.height*3)];
    [sv scrollRectToVisible:CGRectMake(0, sv.frame.size.height, sv.frame.size.width, sv.frame.size.height) animated:NO];
    
    //加0.5来四舍五入
    sv.tag = CLM_TAG_BASE+(p->h)/sv.frame.size.width+0.5;
    
    //NSLog(@"p->h=%d width=%g",p->h,sv.frame.size.width);
    float color = random()%10*0.1;
    float alpha = random()%10*0.1;
    sv.backgroundColor = [UIColor colorWithWhite:color alpha:alpha];
    
    float touchView_wight = sv.frame.size.width;
    float touchView_hight = sv.frame.size.height/7;
    
    for (int i = 0; i<21; i++) {
        [sv addSubview:[self getTouchViewWithFrame:CGRectMake(0, i*touchView_hight, touchView_wight, touchView_hight)]];
    }
    
    return sv;
}
//初始化一个格子
-(UIView*)getTouchViewWithFrame:(CGRect)rect
{
    UIView *resultView = [[UIView alloc]initWithFrame:rect];
    resultView.backgroundColor = [UIColor colorWithRed:0.411011F green:1.000000F blue:0.915016F alpha:1.0F];
    resultView.tag = CELL_TAG_BASE + resultView.frame.origin.y/resultView.frame.size.height;
    CGRect rects = CGRectMake(1, 1, rect.size.width-2,rect.size.height-2);
    
    WXLButton *actionButton = [[WXLButton alloc]init];
    actionButton.frame = rects;
    actionButton.backgroundColor =[UIColor colorWithRed:1.000000F green:0.897748F blue:0.659402F alpha:1.0F];
    [actionButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    actionButton.tag = resultView.tag;
    [resultView addSubview:actionButton];

    return resultView;
}

-(UIView*)getCellWithRow:(int)row Clm:(int)clm
{
    UIScrollView *sv = (UIScrollView*)[_scrollview viewWithTag:(clm+CLM_TAG_BASE)];
    UIView *resultCell = nil;
    if (sv) {
        resultCell = [sv viewWithTag:(row+CELL_TAG_BASE)];
    }
    return resultCell;
}

-(void)clickAction:(id)sender
{
    int button_y = ((UIButton*)sender).tag-CELL_TAG_BASE;
    int button_x = [[((UIButton*)sender)superview]superview].tag-CLM_TAG_BASE;
    NSLog(@"X:%d  Y:%d",button_x,button_y);
    if ([self.gridData recordAtClm:button_x Row:button_y]) {
        
        [((WXLButton*)sender)intiUIOfViewWithColor:[UIColor colorWithRed:0.511400F green:0.721885F blue:1.000000F alpha:1.0F] duration:0.8];
    }else{
        UIColor *bk = [UIColor colorWithRed:1.000000F green:0.897748F blue:0.659402F alpha:1];
        [((WXLButton*)sender)intiUIOfViewWithColor:bk duration:0.8];
        //[((WXLButton*)sender)clean];
    }
    [self playAudio:button_y];
}

//记录点击按钮的位置
-(void)recordInfoWithX:(int)x Y:(int)y
{
    
}

//点击动画
-(void)clickAnmition
{
    
}

- (IBAction)playAction:(UIButton*)sender {
    if (_current_state==0) {
        self.current_state = 1;
        [sender setTitle:NSLocalizedString(@"STOP", nil) forState:UIControlStateNormal];
        [self play];
    }else if(_current_state == 1)
    {
        self.current_state = 0;
        [sender setTitle:NSLocalizedString(@"PLAY", nil) forState:UIControlStateNormal];
        [self pause];
    }
    
}

-(void)play
{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval: self.gridData.speed target: self
                                                selector: @selector(runLoop:) userInfo: nil repeats: YES];
}

-(void)runLoop:(id)sender
{
    [self step];
}
-(void)step
{
    if (_gridData.lastClmNum>=0 && _currentStep<=_gridData.lastClmNum) {
        NSMutableArray *tempArr = [_gridData getItemsByClm:_currentStep];
        for (int i = 0; i<tempArr.count; i++) {
            [self playAudio:((GridItem*)[tempArr objectAtIndex:i]).row];
        }
        self.currentStep ++;
    }else
    {
        self.currentStep = 0;
        //[self pause];
    }
}
-(void)stop
{
    //[self.timer fire];
}

-(void) pause
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
