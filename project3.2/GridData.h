//
//  GridData.h
//  project3.2
//
//  Created by wxl on 13-11-20.
//  Copyright (c) 2013年 wxl. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface GridItem:NSObject

@property(nonatomic,assign) NSInteger row;
@property(nonatomic,assign) NSInteger clm;

@end

@interface GridData : NSObject

@property(nonatomic,assign) double speed;
@property(nonatomic,assign) NSString *tone;
@property(nonatomic,strong) NSMutableDictionary *gridItemDic;
@property(nonatomic,assign)int lastClmNum;

-(NSMutableArray*)getItemsByClm:(NSInteger)clm;
-(BOOL)recordAtClm:(NSInteger)clm Row:(NSInteger)row;

@end
