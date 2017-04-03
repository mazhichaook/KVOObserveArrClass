//
//  NSTimer+DelegateSlef.m
//  KVOObserveArrClass
//
//  Created by 马志超 on 2017/4/3.
//  Copyright © 2017年 ziqiang. All rights reserved.
//

#import "NSTimer+DelegateSlef.h"

@implementation NSTimer (DelegateSlef)

+(NSTimer *)scheduledTimerWithTimeInterval:(int)timeInterval block:(void(^)())block repeats:(BOOL)yesOrNo
{
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(callBlock:) userInfo:[block copy] repeats:yesOrNo];
}


+(void)callBlock:(NSTimer *)timer
{
    void(^block)() = timer.userInfo;
    if (block != nil) {
        block();
    }
}

@end
