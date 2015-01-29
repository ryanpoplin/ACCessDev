//
//  OCUtils.m
//  AACcess
//
//  Created by Byrdann Fox on 1/29/15.
//  Copyright (c) 2015 ExcepApps, Inc. All rights reserved.
//

#import "OCUtils.h"

@implementation OCUtils

for(UIView *temp in self.navigationController.navigationBar.subviews) {
    
    [temp setExclusiveTouch:YES];

}

@end