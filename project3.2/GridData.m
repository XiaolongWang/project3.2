//
//  GridData.m
//  project3.2
//
//  Created by wxl on 13-11-20.
//  Copyright (c) 2013年 wxl. All rights reserved.
//

#import "GridData.h"

@implementation GridItem

-(BOOL)isEqual:(GridItem*)object
{
    if (object.row == self.row && object.clm == self.clm) {
        return YES;
    }
    return NO;
}

@end

@interface GridData()

@end

@implementation GridData

-(NSMutableArray*)getItemsByClm:(NSInteger)clm
{
    NSMutableArray *temp = [_gridItemDic valueForKey:[NSString stringWithFormat:@"%d",clm]];
    return temp;
}

-(BOOL)recordAtClm:(NSInteger)clm Row:(NSInteger)row
{
    GridItem *gi = [[GridItem alloc]init];
    gi.row = row;
    gi.clm = clm;
    
    if (clm>_lastClmNum) {
        self.lastClmNum = clm;
    }
    if (!_gridItemDic) {
        self.gridItemDic = [[NSMutableDictionary alloc]init];
    }
    
    NSMutableArray *temp = [_gridItemDic valueForKey:[NSString stringWithFormat:@"%d",clm]];
    if (!temp) {
        temp = nil;
        temp = [[NSMutableArray alloc]init];
        [self.gridItemDic setObject:temp forKey:[NSString stringWithFormat:@"%d",clm]];
    }
    if (![temp containsObject:gi]) {
        [temp addObject:gi];
        return YES;
    }
    else{
        [temp removeObject:gi];
        return NO;
    }
}

@end
